import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wts_task/features/chat/presentation/widgets/message_bubbles/base_message_bubble.dart';
import 'package:wts_task/features/chat/presentation/widgets/message_time_label.dart';
import 'package:wts_task/features/chat/presentation/view_models/audio_player_view_model.dart';

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
    required this.filePath,
    required this.isMe,
    super.key,
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
  late final AudioPlayerViewModel _vm = AudioPlayerViewModel();

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    await _vm.initialize(
      path: widget.filePath,
      isNetwork: widget.isNetworkAudio,
      initialDurationSeconds: widget.initialDuration,
    );
  }

  String _formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final m = twoDigits(d.inMinutes.remainder(60));
    final s = twoDigits(d.inSeconds.remainder(60));
    return '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _vm,
      child: Consumer<AudioPlayerViewModel>(
        builder: (context, _, _) {
          return Container(
            width: 200,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              color: widget.isMe
                  ? Theme.of(context).primaryColor
                  : Colors.grey[300],
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
        },
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
          child: _vm.isLoading
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : _vm.hasError
              ? Icon(
                  Icons.error,
                  color: widget.isMe ? Colors.white : Colors.red,
                  size: 20,
                )
              : Icon(
                  _vm.isPlaying ? Icons.pause : Icons.play_arrow,
                  color: widget.isMe ? Colors.white : Colors.black87,
                ),
        ),
      ),
      onPressed: _vm.hasError || _vm.isLoading ? null : _vm.togglePlayPause,
    );
  }

  Widget _buildSlider(BuildContext context) {
    if (_vm.hasError) {
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
      value: _vm.position.inMilliseconds.toDouble().clamp(
        0,
        _vm.duration.inMilliseconds.toDouble(),
      ),
      max: _vm.duration.inMilliseconds.toDouble() > 0
          ? _vm.duration.inMilliseconds.toDouble()
          : 1,
      onChanged: _vm.isLoading
          ? null
          : (value) async {
              await _vm.seekTo(Duration(milliseconds: value.toInt()));
            },
      activeColor: widget.isMe
          ? Colors.white
          : Theme.of(context).colorScheme.secondary,
      inactiveColor: widget.isMe ? Colors.white24 : Colors.black12,
      thumbColor: widget.isMe
          ? Colors.white
          : Theme.of(context).colorScheme.secondary,
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          _vm.isLoading ? 'Загрузка...' : _formatDuration(_vm.position),
          style: TextStyle(
            fontSize: 12,
            color: widget.isMe ? Colors.white70 : Colors.black54,
          ),
        ),
        MessageTimeLabel(createdAt: widget.createdAt, isMe: widget.isMe),
      ],
    );
  }
}
