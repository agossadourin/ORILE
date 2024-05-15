import 'package:etourist/app/data/services/api/api.dart';
import 'package:etourist/app/modules/principal/tools_box/sign_translate/widgets/video_player_widget.dart';
import 'package:etourist/app/widgets/reader_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:record/record.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';

class SignTranslatePage extends StatefulWidget {
  const SignTranslatePage({super.key});

  @override
  State<SignTranslatePage> createState() => _SignTranslatePage();
}

class _SignTranslatePage extends State<SignTranslatePage> {
  ApiService api = ApiService();

  late Record audioRecord;
  late AudioPlayer audioPlayer;
  bool isRecording = false;
  String audioPath = ' ';
  String wavPath = '';
  String baseUrl =
      'http://ec2-3-8-117-75.eu-west-2.compute.amazonaws.com:8000/';

  String videoUrl = "";

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
            title: Text('Langage des signes',
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
            height: MediaQuery.of(context).size.height * 0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //dropdowm with values "FR -Yo" and "YO-FR"
                Text(
                    'Enregistrez un audio en francais, et vous obtiens sa traduction vidéo en langue des signes',
                    style: TextStyle(
                        color: Color(0xFF0B4D00),
                        fontSize: 20,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700)),
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
                        onPressed: () async {
                          print("wavPath: $wavPath");
                          String vid =
                              await api.sendAudioFrToSignRequest(audioPath);
                          setState(() {
                            videoUrl = vid;
                          });
                        },
                        child: Text('translate Audio'),
                      ),
                    ],
                  ),

                //show the translated text
                SizedBox(height: 10),
                Column(
                  children: [
                    Text('Transcription',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.3,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1)),
                      // video player from
                      child: videoUrl == ''
                          ? CircularProgressIndicator()
                          : VideoPlayerWidget(url: videoUrl),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
