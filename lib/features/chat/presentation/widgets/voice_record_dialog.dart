import 'package:flutter/material.dart';
import 'package:wts_task/features/chat/presentation/view_models/voice_record_view_model.dart';

class VoiceRecordDialog extends StatefulWidget {
  const VoiceRecordDialog({super.key});

  @override
  State<VoiceRecordDialog> createState() => _VoiceRecordDialogState();
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
