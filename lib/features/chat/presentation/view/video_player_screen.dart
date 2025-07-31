import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({required this.videoPath, super.key});

  final String videoPath;

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;
  bool _isError = false;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    print('VideoPlayerScreen: Инициализация с путем: ${widget.videoPath}');
    _initializeController();
  }

  void _initializeController() {
    final isNetworkVideo =
        widget.videoPath.startsWith('http://') ||
        widget.videoPath.startsWith('https://');

    print('VideoPlayerScreen: isNetworkVideo = $isNetworkVideo');

    try {
      if (isNetworkVideo) {
        print('VideoPlayerScreen: Создаю VideoPlayerController.networkUrl');
        _controller = VideoPlayerController.networkUrl(
          Uri.parse(widget.videoPath),
          videoPlayerOptions: VideoPlayerOptions(
            mixWithOthers: true,
            allowBackgroundPlayback: false,
          ),
        );
      } else {
        print('VideoPlayerScreen: Создаю VideoPlayerController.file');
        _controller = VideoPlayerController.file(
          File(widget.videoPath),
          videoPlayerOptions: VideoPlayerOptions(
            mixWithOthers: true,
            allowBackgroundPlayback: false,
          ),
        );
      }

      _controller
          .initialize()
          .then((_) {
            print('VideoPlayerScreen: Видео успешно инициализировано');
            if (mounted) {
              setState(() {
                _isInitialized = true;
              });
              _controller.play();
            }
          })
          .catchError((error) {
            print('VideoPlayerScreen: Ошибка инициализации: $error');
            if (mounted) {
              setState(() {
                _isError = true;
                _errorMessage = _formatErrorMessage(error.toString());
              });
            }
          });
    } catch (e) {
      print('VideoPlayerScreen: Ошибка создания контроллера: $e');
      if (mounted) {
        setState(() {
          _isError = true;
          _errorMessage = _formatErrorMessage(e.toString());
        });
      }
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: _isError
                ? Column(
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
                          _errorMessage,
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
                            onPressed: () {
                              setState(() {
                                _isError = false;
                                _isInitialized = false;
                                _errorMessage = '';
                              });
                              _initializeController();
                            },
                            child: const Text('Повторить'),
                          ),
                          const SizedBox(width: 16),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Закрыть'),
                          ),
                        ],
                      ),
                    ],
                  )
                : _isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : const CircularProgressIndicator(),
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
          if (_isInitialized)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.55)),
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
                        final newPosition =
                            _controller.value.position -
                            const Duration(seconds: 5);
                        _controller.seekTo(
                          newPosition > Duration.zero
                              ? newPosition
                              : Duration.zero,
                        );
                      },
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      icon: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause_circle_filled
                            : Icons.play_circle_filled,
                        color: Colors.white,
                        size: 48,
                      ),
                      onPressed: () {
                        setState(() {
                          _controller.value.isPlaying
                              ? _controller.pause()
                              : _controller.play();
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
                        final max = _controller.value.duration;
                        final newPosition =
                            _controller.value.position +
                            const Duration(seconds: 5);
                        _controller.seekTo(
                          newPosition < max ? newPosition : max,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
