import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class VoiceRecordDialog extends StatefulWidget {
  const VoiceRecordDialog({super.key});

  @override
  State<VoiceRecordDialog> createState() => _VoiceRecordDialogState();
}

class VoiceRecordViewModel {
  VoiceRecordViewModel();

  final FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  bool isInitialized = false;
  bool isRecording = false;
  String? audioPath;

  Future<void> initialize() async {
    var status = await Permission.microphone.request();
    print('Microphone permission status: $status');
    await _recorder.openRecorder();
    isInitialized = true;
  }

  Future<void> startRecording() async {
    final dir = await getTemporaryDirectory();
    final path = '${dir.path}/voice_${DateTime.now().millisecondsSinceEpoch}.aac';
    await _recorder.startRecorder(toFile: path, codec: Codec.aacADTS);
    isRecording = true;
    audioPath = path;
  }

  Future<void> stopRecording() async {
    await _recorder.stopRecorder();
    isRecording = false;
  }

  Future<void> dispose() async {
    await _recorder.closeRecorder();
  }
}

class _VoiceRecordDialogState extends State<VoiceRecordDialog> {
  late final VoiceRecordViewModel _vm;

  @override
  void initState() {
    super.initState();
    _vm = VoiceRecordViewModel();
    _init();
  }

  Future<void> _init() async {
    try {
      await _vm.initialize();
      if (!mounted) return;
      setState(() {});
    } catch (e) {
      print('Recorder init error: $e');
    }
  }

  @override
  void dispose() {
    _vm.dispose();
    super.dispose();
  }

  Future<void> _startRecording() async {
    await _vm.startRecording();
    setState(() {});
  }

  Future<void> _stopRecording() async {
    await _vm.stopRecording();
    setState(() {});
    if (_vm.audioPath != null) {
      Navigator.of(context).pop(_vm.audioPath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Голосовое сообщение'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _vm.isRecording ? Icons.mic : Icons.mic_none,
            size: 48,
            color: Colors.red,
          ),
          const SizedBox(height: 16),
          Text(_vm.isRecording ? 'Идет запись...' : 'Нажмите для начала записи'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Отмена'),
        ),
        ElevatedButton(
          onPressed: !_vm.isInitialized
              ? null
              : () async {
                  if (_vm.isRecording) {
                    await _stopRecording();
                  } else {
                    await _startRecording();
                  }
                },
          child: Text(_vm.isRecording ? 'Стоп' : 'Записать'),
        ),
      ],
    );
  }
}
