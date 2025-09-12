import 'package:flutter/foundation.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class VoiceRecordViewModel extends ChangeNotifier {
  VoiceRecordViewModel();

  final FlutterSoundRecorder _recorder = FlutterSoundRecorder();

  bool _isInitialized = false;
  bool _isRecording = false;
  String? _audioPath;

  bool get isInitialized => _isInitialized;
  bool get isRecording => _isRecording;
  String? get audioPath => _audioPath;

  Future<void> initialize() async {
    final status = await Permission.microphone.request();
    if (status.isDenied || status.isPermanentlyDenied) {
      throw Exception('Microphone permission denied');
    }
    await _recorder.openRecorder();
    _isInitialized = true;
    notifyListeners();
  }

  Future<void> startRecording() async {
    final dir = await getTemporaryDirectory();
    final path = '${dir.path}/voice_${DateTime.now().millisecondsSinceEpoch}.aac';
    await _recorder.startRecorder(toFile: path, codec: Codec.aacADTS);
    _isRecording = true;
    _audioPath = path;
    notifyListeners();
  }

  Future<void> stopRecording() async {
    await _recorder.stopRecorder();
    _isRecording = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _recorder.closeRecorder();
    super.dispose();
  }
}


