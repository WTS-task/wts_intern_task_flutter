import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewerScreen extends StatefulWidget {
  const ImageViewerScreen({required this.imagePath, super.key});

  final String imagePath;

  @override
  State<ImageViewerScreen> createState() => _ImageViewerScreenState();
}

class _ImageViewerScreenState extends State<ImageViewerScreen> {
  double _rotation = 0.0;

  void _rotateImage() {
    setState(() {
      _rotation += 90;
      if (_rotation >= 360) _rotation = 0;
    });
  }

  ImageProvider _getImageProvider() {
    final isNetworkImage =
        widget.imagePath.startsWith('http://') ||
        widget.imagePath.startsWith('https://');

    if (isNetworkImage) {
      return NetworkImage(widget.imagePath);
    } else {
      return FileImage(File(widget.imagePath));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: Transform.rotate(
              angle: _rotation * 3.1415926535 / 180,
              child: PhotoView(
                imageProvider: _getImageProvider(),
                backgroundDecoration: const BoxDecoration(color: Colors.black),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 2,
                enableRotation: false,
                loadingBuilder: (context, event) {
                  if (event == null) return const SizedBox.shrink();
                  return Center(
                    child: CircularProgressIndicator(
                      value: event.expectedTotalBytes != null
                          ? event.cumulativeBytesLoaded /
                                event.expectedTotalBytes!
                          : null,
                      color: Colors.white,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.broken_image, color: Colors.white, size: 64),
                        SizedBox(height: 16),
                        Text(
                          'Ошибка загрузки изображения',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 10,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(0, 0, 0, 0.55),
                borderRadius: BorderRadius.circular(25),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 24,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 24,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(0, 0, 0, 0.55),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                onPressed: _rotateImage,
                icon: const Icon(Icons.rotate_90_degrees_ccw),
                label: const Text('Повернуть'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
