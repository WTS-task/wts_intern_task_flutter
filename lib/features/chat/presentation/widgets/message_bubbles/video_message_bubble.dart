import 'package:flutter/material.dart';
import 'package:wts_task/features/chat/presentation/view/video_player_screen.dart';
import 'package:wts_task/features/chat/presentation/widgets/message_time_label.dart';
import 'package:wts_task/features/chat/presentation/widgets/message_bubbles/base_message_bubble.dart';

class VideoMessageBubble extends BaseMessageBubble {
  const VideoMessageBubble({required super.message, super.key});

  @override
  Widget buildBubble(BuildContext context) {
    final isMe = this.isMe;
    final file = this.file!;
    final createdAt = this.createdAt;
    final videoPath = file.url!;

    final isNetworkVideo =
        videoPath.startsWith('http://') || videoPath.startsWith('https://');

    String? previewUrl;
    if (file.videoFile?.videoPreviewImageFile?.url != null) {
      previewUrl = file.videoFile!.videoPreviewImageFile!.url;
    } else if (file.videoFile?.videoPreviewImageFile?.previewUrl != null) {
      previewUrl = file.videoFile!.videoPreviewImageFile!.previewUrl;
    }

    final duration = file.videoFile?.duration;

    Widget previewWidget;

    if (previewUrl != null && isNetworkVideo) {
      previewWidget = Image.network(
        previewUrl,
        fit: BoxFit.cover,
        cacheWidth: 400,
        errorBuilder: (context, error, stackTrace) => _buildFallbackPreview(),
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return _buildLoadingPreview();
        },
      );
    } else {
      previewWidget = _buildLocalVideoPreview();
    }

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => VideoPlayerScreen(videoPath: videoPath),
          ),
        );
      },
      child: Container(
        constraints: const BoxConstraints(minWidth: 150, maxWidth: 250),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isMe ? Theme.of(context).primaryColor : Colors.grey[300]!,
            width: 2,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            children: [
              previewWidget,
              // Иконка воспроизведения
              const Positioned.fill(
                child: Center(
                  child: Icon(
                    Icons.play_circle_fill,
                    color: Colors.white,
                    size: 48,
                  ),
                ),
              ),
              if (duration != null)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha(180),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      _formatDuration(duration),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              // Время сообщения
              if (createdAt != null)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.black.withAlpha(128),
                    padding: const EdgeInsets.symmetric(
                      vertical: 2,
                      horizontal: 8,
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: MessageTimeLabel(createdAt: createdAt, isMe: isMe),
                    ),
                  ),
                ),
              if (file.originalName != null)
                Positioned(
                  bottom: 0,
                  left: 8,
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 120),
                    padding: const EdgeInsets.symmetric(
                      vertical: 2,
                      horizontal: 4,
                    ),
                    child: Text(
                      file.originalName!,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLocalVideoPreview() {
    return Container(
      constraints: const BoxConstraints(minWidth: 150, maxWidth: 250),
      color: Colors.grey[400],
      child: const AspectRatio(
        aspectRatio: 16 / 9,
        child: Center(
          child: Icon(Icons.videocam, color: Colors.white70, size: 48),
        ),
      ),
    );
  }

  Widget _buildFallbackPreview() {
    return Container(
      constraints: const BoxConstraints(minWidth: 150, maxWidth: 250),
      color: Colors.grey[300],
      child: const AspectRatio(
        aspectRatio: 16 / 9,
        child: Center(
          child: Icon(Icons.videocam, color: Colors.white70, size: 48),
        ),
      ),
    );
  }

  Widget _buildLoadingPreview() {
    return Container(
      constraints: const BoxConstraints(minWidth: 150, maxWidth: 250),
      color: Colors.grey[200],
      child: const AspectRatio(
        aspectRatio: 16 / 9,
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }

  String _formatDuration(double seconds) {
    final minutes = (seconds / 60).floor();
    final remainingSeconds = (seconds % 60).floor();
    return '${minutes}:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}
