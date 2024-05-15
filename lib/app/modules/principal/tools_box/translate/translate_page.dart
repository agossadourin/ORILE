import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class TranslatePage extends StatefulWidget {
  final String? startLanguage;
  final String? endLanguage;

  const TranslatePage(
      {Key? key, required this.startLanguage, required this.endLanguage})
      : super(key: key);

  @override
  _TranslatePageState createState() => _TranslatePageState();
}

class _TranslatePageState extends State<TranslatePage> {
  FlutterSoundRecorder? _recorder;
  String? _path;

  @override
  void initState() {
    super.initState();
    _recorder = FlutterSoundRecorder();
    _init();
  }

  Future<void> _init() async {
    await _recorder!.openRecorder();
  }

  Future<void> _startRecording() async {
    await _recorder!.startRecorder();
  }

  Future<void> _stopRecordingAndUpload() async {
    await _recorder!.stopRecorder();
    if (_path != null) {
      var request =
          http.MultipartRequest('POST', Uri.parse('http://your-api-url.com'));
      request.files.add(await http.MultipartFile.fromPath('audio', _path!));
      var res = await request.send();
      if (res.statusCode == 200) {
        print("Uploaded!");
      } else {
        print("Upload failed");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _startRecording,
              child: Text('Start Recording'),
            ),
            ElevatedButton(
              onPressed: _stopRecordingAndUpload,
              child: Text('Stop and Upload'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _recorder!.closeRecorder();
    _recorder = null;
    super.dispose();
  }
}
