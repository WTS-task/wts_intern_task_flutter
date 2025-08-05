import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class VoiceRecordDialog extends StatefulWidget {
  const VoiceRecordDialog({super.key});

  @override
  State<VoiceRecordDialog> createState() => _VoiceRecordDialogState();
}

class _VoiceRecordDialogState extends State<VoiceRecordDialog> {
  bool _isRecording = false;

  FlutterSoundRecorder? _recorder;
  String? _audioPath;
  bool _isInited = false;

  @override
  void initState() {
    super.initState();
    _recorder = FlutterSoundRecorder();
    _init();
  }

  Future<void> _init() async {
    try {
      var status = await Permission.microphone.request();
      print('Microphone permission status: $status');
      await _recorder!.openRecorder();
      setState(() {
        _isInited = true;
      });
    } catch (e) {
      print('Recorder init error: $e');
    }
  }

  @override
  void dispose() {
    _recorder?.closeRecorder();
    _recorder = null;
    super.dispose();
  }

  Future<void> _startRecording() async {
    final dir = await getTemporaryDirectory();
    final path =
        '${dir.path}/voice_${DateTime.now().millisecondsSinceEpoch}.aac';
    await _recorder!.startRecorder(toFile: path, codec: Codec.aacADTS);
    setState(() {
      _isRecording = true;
      _audioPath = path;
    });
  }

  Future<void> _stopRecording() async {
    await _recorder!.stopRecorder();
    setState(() {
      _isRecording = false;
    });
    if (_audioPath != null) {
      Navigator.of(context).pop(_audioPath);
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
            _isRecording ? Icons.mic : Icons.mic_none,
            size: 48,
            color: Colors.red,
          ),
          const SizedBox(height: 16),
          Text(_isRecording ? 'Идет запись...' : 'Нажмите для начала записи'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Отмена'),
        ),
        ElevatedButton(
          onPressed: !_isInited
              ? null
              : () async {
                  if (_isRecording) {
                    await _stopRecording();
                  } else {
                    await _startRecording();
                  }
                },
          child: Text(_isRecording ? 'Стоп' : 'Записать'),
        ),
      ],
    );
  }
}
