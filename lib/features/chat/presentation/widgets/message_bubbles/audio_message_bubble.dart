import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:wts_task/features/chat/presentation/widgets/message_bubbles/base_message_bubble.dart';
import 'package:wts_task/features/chat/presentation/widgets/message_time_label.dart';

class AudioMessageBubble extends BaseMessageBubble {
  const AudioMessageBubble({required super.message, super.key});

  @override
  Widget buildBubble(BuildContext context) {
    final isMe = this.isMe;
    final file = this.file!;
    final createdAt = this.createdAt;
    final audioPath = file.url!;

    final isNetworkAudio =
        audioPath.startsWith('http://') || audioPath.startsWith('https://');

    final duration = file.audioFile?.duration;

    return AudioPlayerBubble(
      filePath: audioPath,
      isMe: isMe,
      createdAt: createdAt,
      fileName: file.originalName,
      isNetworkAudio: isNetworkAudio,
      initialDuration: duration,
    );
  }
}

class AudioPlayerBubble extends StatefulWidget {
  const AudioPlayerBubble({
    super.key,
    required this.filePath,
    required this.isMe,
    this.createdAt,
    this.fileName,
    this.isNetworkAudio = false,
    this.initialDuration,
  });

  final String filePath;
  final bool isMe;
  final DateTime? createdAt;
  final String? fileName;
  final bool isNetworkAudio;
  final double? initialDuration;

  @override
  State<AudioPlayerBubble> createState() => _AudioPlayerBubbleState();
}

class _AudioPlayerBubbleState extends State<AudioPlayerBubble> {
  late final AudioPlayerViewModel _vm;

  @override
  void initState() {
    super.initState();
    _vm = AudioPlayerViewModel();
    _init();
  }

  Future<void> _init() async {
    await _vm.initialize(
      path: widget.filePath,
      isNetwork: widget.isNetworkAudio,
      initialDurationSeconds: widget.initialDuration,
    );
    if (!mounted) return;
    _vm.isPlaying.addListener(_notify);
    _vm.isLoading.addListener(_notify);
    _vm.hasError.addListener(_notify);
    _vm.duration.addListener(_notify);
    _vm.position.addListener(_notify);
    setState(() {});
  }

  void _notify() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _vm.dispose();
    super.dispose();
  }

  String _formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final m = twoDigits(d.inMinutes.remainder(60));
    final s = twoDigits(d.inSeconds.remainder(60));
    return '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: widget.isMe ? Theme.of(context).primaryColor : Colors.grey[300],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildPlayButton(),
          const SizedBox(width: 2),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 26, child: _buildSlider(context)),
                _buildFooter(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlayButton() {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      icon: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: widget.isMe
              ? const Color.fromRGBO(0, 0, 0, 0.18)
              : const Color.fromRGBO(255, 255, 255, 0.85),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: _vm.isLoading.value
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : _vm.hasError.value
                  ? Icon(
                      Icons.error,
                      color: widget.isMe ? Colors.white : Colors.red,
                      size: 20,
                    )
                  : Icon(
                      _vm.isPlaying.value ? Icons.pause : Icons.play_arrow,
                      color: widget.isMe ? Colors.white : Colors.black87,
                    ),
        ),
      ),
      onPressed: _vm.hasError.value || _vm.isLoading.value
          ? null
          : () async {
              _vm.togglePlayPause();
            },
    );
  }

  Widget _buildSlider(BuildContext context) {
    if (_vm.hasError.value) {
      return Center(
        child: Text(
          'Ошибка загрузки',
          style: TextStyle(
            fontSize: 12,
            color: widget.isMe ? Colors.white70 : Colors.red,
          ),
        ),
      );
    }
    return Slider(
      value: _vm.position.value.inMilliseconds.toDouble().clamp(
        0,
        _vm.duration.value.inMilliseconds.toDouble(),
      ),
      min: 0,
      max: _vm.duration.value.inMilliseconds.toDouble() > 0
          ? _vm.duration.value.inMilliseconds.toDouble()
          : 1,
      onChanged: _vm.isLoading.value
          ? null
          : (value) async {
              await _vm.seekTo(
                Duration(milliseconds: value.toInt()),
              );
            },
      activeColor:
          widget.isMe ? Colors.white : Theme.of(context).colorScheme.secondary,
      inactiveColor: widget.isMe ? Colors.white24 : Colors.black12,
      thumbColor:
          widget.isMe ? Colors.white : Theme.of(context).colorScheme.secondary,
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          _vm.isLoading.value
              ? 'Загрузка...'
              : _formatDuration(_vm.position.value),
          style: TextStyle(
            fontSize: 12,
            color: widget.isMe ? Colors.white70 : Colors.black54,
          ),
        ),
        MessageTimeLabel(
          createdAt: widget.createdAt,
          isMe: widget.isMe,
        ),
      ],
    );
  }
}

class AudioPlayerViewModel {
  AudioPlayerViewModel();

  final AudioPlayer _player = AudioPlayer();

  final ValueNotifier<bool> isPlaying = ValueNotifier<bool>(false);
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(true);
  final ValueNotifier<bool> hasError = ValueNotifier<bool>(false);
  final ValueNotifier<Duration> duration = ValueNotifier<Duration>(Duration.zero);
  final ValueNotifier<Duration> position = ValueNotifier<Duration>(Duration.zero);

  Future<void> initialize({
    required String path,
    required bool isNetwork,
    double? initialDurationSeconds,
  }) async {
    try {
      isLoading.value = true;
      hasError.value = false;

      if (isNetwork) {
        await _player.setUrl(path);
      } else {
        await _player.setFilePath(path);
      }

      if (initialDurationSeconds != null) {
        duration.value = Duration(milliseconds: (initialDurationSeconds * 1000).round());
      } else {
        duration.value = _player.duration ?? Duration.zero;
      }

      _player.positionStream.listen((pos) {
        position.value = pos;
      });
      _player.playerStateStream.listen((state) {
        isPlaying.value = state.playing;
      });

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      hasError.value = true;
    }
  }

  Future<void> togglePlayPause() async {
    if (hasError.value || isLoading.value) return;
    if (isPlaying.value) {
      await _player.pause();
    } else {
      await _player.play();
    }
  }

  Future<void> seekTo(Duration target) async {
    await _player.seek(target);
  }

  Future<void> dispose() async {
    await _player.dispose();
  }
}
