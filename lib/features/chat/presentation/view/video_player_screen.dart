import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({required this.videoPath, super.key});

  final String videoPath;

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class VideoPlayerViewModel {
  late VideoPlayerController controller;
  bool isInitialized = false;
  bool isError = false;
  String errorMessage = '';

  Future<void> initialize(String videoPath) async {
    final isNetworkVideo =
        videoPath.startsWith('http://') || videoPath.startsWith('https://');
    try {
      if (isNetworkVideo) {
        controller = VideoPlayerController.networkUrl(
          Uri.parse(videoPath),
          videoPlayerOptions: VideoPlayerOptions(
            mixWithOthers: true,
            allowBackgroundPlayback: false,
          ),
        );
      } else {
        controller = VideoPlayerController.file(
          File(videoPath),
          videoPlayerOptions: VideoPlayerOptions(
            mixWithOthers: true,
            allowBackgroundPlayback: false,
          ),
        );
      }

      await controller.initialize();
      isInitialized = true;
      await controller.play();
    } catch (e) {
      isError = true;
      errorMessage = _formatErrorMessage(e.toString());
    }
  }

  String _formatErrorMessage(String error) {
    if (error.contains('MediaCodecVideoRenderer error')) {
      return 'Ошибка декодирования видео. Попробуйте другое видео или проверьте формат файла.';
    } else if (error.contains('ExoPlaybackException')) {
      return 'Ошибка воспроизведения. Видео может быть повреждено или иметь неподдерживаемый формат.';
    } else if (error.contains('NetworkException')) {
      return 'Ошибка сети. Проверьте интернет-соединение.';
    } else {
      return 'Ошибка загрузки видео: ${error.length > 100 ? error.substring(0, 100) + '...' : error}';
    }
  }

  void togglePlayPause() {
    if (!isInitialized || isError) return;
    if (controller.value.isPlaying) {
      controller.pause();
    } else {
      controller.play();
    }
  }

  void seekRelative(Duration offset) {
    if (!isInitialized || isError) return;
    final current = controller.value.position;
    final duration = controller.value.duration;
    final target = current + offset;
    final clamped = target < Duration.zero
        ? Duration.zero
        : (target > duration ? duration : target);
    controller.seekTo(clamped);
  }

  Future<void> retry(String videoPath) async {
    isError = false;
    isInitialized = false;
    errorMessage = '';
    await initialize(videoPath);
  }

  void dispose() {
    controller.dispose();
  }
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late final VideoPlayerViewModel _vm;

  @override
  void initState() {
    super.initState();
    _vm = VideoPlayerViewModel();
    _initialize();
  }

  Future<void> _initialize() async {
    await _vm.initialize(widget.videoPath);
    if (!mounted) return;
    setState(() {});
  }

  @override
  void dispose() {
    _vm.dispose();
    super.dispose();
  }

  Widget _buildCenterContent() {
    if (_vm.isError) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            color: Colors.white,
            size: 64,
          ),
          const SizedBox(height: 16),
          const Text(
            'Ошибка загрузки видео',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              _vm.errorMessage,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await _vm.retry(widget.videoPath);
                  if (!mounted) return;
                  setState(() {});
                },
                child: const Text('Повторить'),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Закрыть'),
              ),
            ],
          ),
        ],
      );
    }
    if (_vm.isInitialized) {
      return AspectRatio(
        aspectRatio: _vm.controller.value.aspectRatio,
        child: VideoPlayer(_vm.controller),
      );
    }
    return const CircularProgressIndicator();
  }

  Widget _buildControls() {
    if (!_vm.isInitialized) return const SizedBox.shrink();
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        decoration: const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.55)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(
                Icons.replay_5,
                color: Colors.white,
                size: 32,
              ),
              onPressed: () {
                setState(() {
                  _vm.seekRelative(const Duration(seconds: -5));
                });
              },
            ),
            const SizedBox(width: 16),
            IconButton(
              icon: Icon(
                _vm.controller.value.isPlaying
                    ? Icons.pause_circle_filled
                    : Icons.play_circle_filled,
                color: Colors.white,
                size: 48,
              ),
              onPressed: () {
                setState(() {
                  _vm.togglePlayPause();
                });
              },
            ),
            const SizedBox(width: 16),
            IconButton(
              icon: const Icon(
                Icons.forward_5,
                color: Colors.white,
                size: 32,
              ),
              onPressed: () {
                setState(() {
                  _vm.seekRelative(const Duration(seconds: 5));
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(child: _buildCenterContent()),
          Positioned(
            top: MediaQuery.paddingOf(context).top + 10,
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
          _buildControls(),
        ],
      ),
    );
  }
}
