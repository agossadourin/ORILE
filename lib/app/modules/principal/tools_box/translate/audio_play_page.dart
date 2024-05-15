import 'package:etourist/app/data/services/api/api.dart';
import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AudioPlayPage extends StatefulWidget {
  const AudioPlayPage({super.key});

  @override
  State<AudioPlayPage> createState() => _AudioPlayPageState();
}

class _AudioPlayPageState extends State<AudioPlayPage> {
  ApiService api = ApiService();

  late Record audioRecord;
  late AudioPlayer audioPlayer;
  bool isRecording = false;
  String audioPath = ' ';
  String wavPath = '';
  String baseUrl =
      'http://ec2-3-8-117-75.eu-west-2.compute.amazonaws.com:8000/';

  @override
  void initState() {
    audioPlayer = AudioPlayer();
    audioRecord = Record();
    super.initState();
  }

  @override
  void dispose() {
    audioRecord.dispose();
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> startRecording() async {
    try {
      if (await audioRecord.hasPermission()) {
        print('**************************************is workin');
        await audioRecord.start();
        setState(() {
          isRecording = true;
        });
      } else {
        print('*********************************\nNo permission');
      }
    } catch (e) {
      print('Error start recording: $e');
    }
  }

  Future<void> stopRecording() async {
    try {
      String? path = await audioRecord.stop();

      setState(() {
        isRecording = false;
        audioPath = path!;
      });
    } catch (e) {
      print('Error stop recording: $e');
    }
  }

  Future<void> playRecording() async {
    try {
      Source urlSource = await UrlSource(audioPath);
      await audioPlayer.play(urlSource);
    } catch (e) {
      print('Error playing: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.4,
      color: Colors.amber,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isRecording) Text('Recording...'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: isRecording ? stopRecording : startRecording,
              child: Text(isRecording ? 'Stop Recording' : 'Start Recording'),
            ),
            SizedBox(height: 20),
            if (!isRecording && audioPath != '')
              ElevatedButton(
                onPressed: playRecording,
                child: Text('Play Audio'),
              ),
            SizedBox(
              height: 20,
            ),
            if (!isRecording && audioPath != '')
              ElevatedButton(
                onPressed: () {
                  print("wavPath: $wavPath");
                  api.sendAudioFrToTextFrRequest(audioPath);
                },
                child: Text('translate Audio'),
              )
          ],
        ),
      ),
    );
  }
}
