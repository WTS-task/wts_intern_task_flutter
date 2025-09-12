import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerViewModel extends ChangeNotifier {
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
          videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
        );
      } else {
        controller = VideoPlayerController.file(
          File(videoPath),
          videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
        );
      }

      await controller.initialize();
      isInitialized = true;
      await controller.play();
      notifyListeners();
    } catch (e) {
      isError = true;
      errorMessage = _formatErrorMessage(e.toString());
      notifyListeners();
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
      return 'Ошибка загрузки видео: ${error.length > 100 ? '${error.substring(0, 100)}...' : error}';
    }
  }

  void togglePlayPause() {
    if (!isInitialized || isError) return;
    if (controller.value.isPlaying) {
      controller.pause();
    } else {
      controller.play();
    }
    notifyListeners();
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
    notifyListeners();
  }

  Future<void> retry(String videoPath) async {
    isError = false;
    isInitialized = false;
    errorMessage = '';
    notifyListeners();
    await initialize(videoPath);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
