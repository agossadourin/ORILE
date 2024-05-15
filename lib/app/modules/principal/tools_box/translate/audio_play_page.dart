import 'package:etourist/app/data/models/translated_audio.dart';
import 'package:etourist/app/data/services/api/api.dart';
import 'package:etourist/app/widgets/reader_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
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
  bool isLoading = true;
  String transcript = '';

  String dropdownValue = 'Francais - Yoruba';
  late TranslatedAudio translatedAudio;

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

  Future<void> playTranslation() async {
    try {
      setState(() {
        isLoading = true;
      });
      TranslatedAudio resp =
          await api.sendAudioYoToAudioFrRequest(dropdownValue, audioPath);
      Source urlSource = await UrlSource(resp.link);
      setState(() {
        isLoading = false;
        transcript = resp.text;
      });
      await audioPlayer.play(urlSource);
    } catch (e) {
      print('Error playing: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xFF0B4D00),
            title: Text('Traducteur',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //dropdowm with values "FR -Yo" and "YO-FR"
                DropdownButton<String>(
                  value: dropdownValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['Francais - Yoruba', 'Yoruba - Francais']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                if (isRecording) Text('Recording...'),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: isRecording ? stopRecording : startRecording,
                  child:
                      Text(isRecording ? 'Stop Recording' : 'Start Recording'),
                ),
                SizedBox(height: 20),
                if (isLoading) CircularProgressIndicator(),
                if (!isRecording && audioPath != '')
                  ElevatedButton(
                    onPressed: playTranslation,
                    child: Text('Play Translation'),
                  ),
                SizedBox(
                  height: 20,
                ),
                //show the translated text
                SizedBox(height: 20),
                Column(
                  children: [
                    Text('Transcription',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.2,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1)),
                      child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Text(transcript)),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
