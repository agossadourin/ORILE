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
  String baseUrl =
      'http://ec2-3-8-117-75.eu-west-2.compute.amazonaws.com:8000/';

  String dropdownValue = 'Francais - Yoruba';

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
            color: Colors.amber,
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
                if (!isRecording && audioPath != '')
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: playRecording,
                        child: Text('Play Audio'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          print("wavPath: $wavPath");
                          api.sendAudioFrToTextFrRequest(audioPath);
                        },
                        child: Text('translate Audio'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ReaderButton(textToRead: 'text', language: 'francais')
                    ],
                  ),

                //show the translated text
                SizedBox(height: 20),
                Column(
                  children: [
                    Text('Transcription',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. lorem lipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
