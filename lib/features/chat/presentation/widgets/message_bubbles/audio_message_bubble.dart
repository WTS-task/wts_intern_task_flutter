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
  late AudioPlayer _player;
  bool _isPlaying = false;
  bool _isLoading = true;
  bool _hasError = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _init();
  }

  Future<void> _init() async {
    try {
      setState(() {
        _isLoading = true;
        _hasError = false;
      });

      if (widget.isNetworkAudio) {
        await _player.setUrl(widget.filePath);
      } else {
        await _player.setFilePath(widget.filePath);
      }

      if (widget.initialDuration != null) {
        _duration = Duration(
          milliseconds: (widget.initialDuration! * 1000).round(),
        );
      } else {
        _duration = _player.duration ?? Duration.zero;
      }

      _player.positionStream.listen((pos) {
        if (mounted) {
          setState(() {
            _position = pos;
          });
        }
      });

      _player.playerStateStream.listen((state) {
        if (mounted) {
          setState(() {
            _isPlaying = state.playing;
          });
        }
      });

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print('Audio error: $e');
      setState(() {
        _isLoading = false;
        _hasError = true;
      });
    }
  }

  @override
  void dispose() {
    _player.dispose();
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
          IconButton(
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
                child: _isLoading
                    ? SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: widget.isMe ? Colors.white : Colors.black87,
                        ),
                      )
                    : _hasError
                    ? Icon(
                        Icons.error,
                        color: widget.isMe ? Colors.white : Colors.red,
                        size: 20,
                      )
                    : Icon(
                        _isPlaying ? Icons.pause : Icons.play_arrow,
                        color: widget.isMe ? Colors.white : Colors.black87,
                      ),
              ),
            ),
            onPressed: _hasError || _isLoading
                ? null
                : () async {
                    if (_isPlaying) {
                      await _player.pause();
                    } else {
                      await _player.play();
                    }
                  },
          ),
          const SizedBox(width: 2),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 26,
                  child: _hasError
                      ? Center(
                          child: Text(
                            'Ошибка загрузки',
                            style: TextStyle(
                              fontSize: 12,
                              color: widget.isMe ? Colors.white70 : Colors.red,
                            ),
                          ),
                        )
                      : Slider(
                          value: _position.inMilliseconds.toDouble().clamp(
                            0,
                            _duration.inMilliseconds.toDouble(),
                          ),
                          min: 0,
                          max: _duration.inMilliseconds.toDouble() > 0
                              ? _duration.inMilliseconds.toDouble()
                              : 1,
                          onChanged: _isLoading
                              ? null
                              : (value) async {
                                  await _player.seek(
                                    Duration(milliseconds: value.toInt()),
                                  );
                                },
                          activeColor: widget.isMe
                              ? Colors.white
                              : Theme.of(context).colorScheme.secondary,
                          inactiveColor: widget.isMe
                              ? Colors.white24
                              : Colors.black12,
                          thumbColor: widget.isMe
                              ? Colors.white
                              : Theme.of(context).colorScheme.secondary,
                        ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _isLoading ? 'Загрузка...' : _formatDuration(_position),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
