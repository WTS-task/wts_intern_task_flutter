import 'dart:io';
import 'package:flutter/material.dart';
import 'package:wts_task/features/chat/presentation/view/image_viewer_screen.dart';
import 'package:wts_task/features/chat/presentation/widgets/message_time_label.dart';
import 'package:wts_task/features/chat/presentation/widgets/message_bubbles/base_message_bubble.dart';
import 'package:wts_task/core/widgets/custom_cached_image.dart';

class ImageMessageBubble extends BaseMessageBubble {
  const ImageMessageBubble({required super.message, super.key});

  @override
  Widget buildBubble(BuildContext context) {
    final isMe = this.isMe;
    final file = this.file!;
    final createdAt = this.createdAt;
    final imagePath = file.url!;

    final isNetworkImage =
        imagePath.startsWith('http://') || imagePath.startsWith('https://');

    Widget imageWidget;

    if (isNetworkImage) {
      imageWidget = const SizedBox();
    } else {
      imageWidget = Image.file(
        File(imagePath),
        fit: BoxFit.cover,
        cacheWidth: 400,
        errorBuilder: (context, error, stackTrace) => Container(
          constraints: const BoxConstraints(minWidth: 150, maxWidth: 250),
          height: 120,
          color: Colors.grey[300],
          child: const Icon(Icons.broken_image, color: Colors.red),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ImageViewerScreen(imagePath: imagePath),
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
              if (isNetworkImage)
                const SizedBox.shrink()
              else
                imageWidget,
              if (isNetworkImage)
                CustomCachedImage(
                  imageUrl: imagePath,
                  width: double.infinity,
                  height: 120,
                  fit: BoxFit.cover,
                ),
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
            ],
          ),
        ),
      ),
    );
  }
}
