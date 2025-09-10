import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerViewModel extends ChangeNotifier {
  AudioPlayerViewModel();

  final AudioPlayer _player = AudioPlayer();

  bool _isPlaying = false;
  bool _isLoading = true;
  bool _hasError = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  bool get isPlaying => _isPlaying;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;
  Duration get duration => _duration;
  Duration get position => _position;

  Future<void> initialize({
    required String path,
    required bool isNetwork,
    double? initialDurationSeconds,
  }) async {
    try {
      _isLoading = true;
      _hasError = false;
      notifyListeners();

      if (isNetwork) {
        await _player.setUrl(path);
      } else {
        await _player.setFilePath(path);
      }

      if (initialDurationSeconds != null) {
        _duration = Duration(milliseconds: (initialDurationSeconds * 1000).round());
      } else {
        _duration = _player.duration ?? Duration.zero;
      }

      _player.positionStream.listen((pos) {
        _position = pos;
        notifyListeners();
      });
      _player.playerStateStream.listen((state) {
        _isPlaying = state.playing;
        notifyListeners();
      });

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _hasError = true;
      notifyListeners();
    }
  }

  Future<void> togglePlayPause() async {
    if (_hasError || _isLoading) return;
    if (_isPlaying) {
      await _player.pause();
    } else {
      await _player.play();
    }
  }

  Future<void> seekTo(Duration target) async {
    await _player.seek(target);
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}


