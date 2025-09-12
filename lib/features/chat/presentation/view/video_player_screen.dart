import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:wts_task/features/chat/presentation/view_models/video_player_view_model.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({required this.videoPath, super.key});

  final String videoPath;

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late final VideoPlayerViewModel _vm = VideoPlayerViewModel();

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    await _vm.initialize(widget.videoPath);
  }

  Widget _buildCenterContent() {
    if (_vm.isError) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: Colors.white, size: 64),
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
              style: const TextStyle(color: Colors.white70, fontSize: 12),
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.55)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.replay_5, color: Colors.white, size: 32),
              onPressed: () {
                _vm.seekRelative(const Duration(seconds: -5));
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
                _vm.togglePlayPause();
              },
            ),
            const SizedBox(width: 16),
            IconButton(
              icon: const Icon(Icons.forward_5, color: Colors.white, size: 32),
              onPressed: () {
                _vm.seekRelative(const Duration(seconds: 5));
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _vm,
      child: Consumer<VideoPlayerViewModel>(
        builder: (context, _, _) {
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
        },
      ),
    );
  }

  @override
  void dispose() {
    _vm.dispose();
    super.dispose();
  }
}
