import 'dart:io';

import 'package:camera/camera.dart';
import 'package:etourist/app/data/models/image_description_model.dart';
import 'package:etourist/app/data/services/api/api.dart';
import 'package:etourist/app/widgets/reader_button.dart';
import 'package:flutter/material.dart';

class ImageDescriptorPage extends StatefulWidget {
  @override
  _ImageDescriptorPageState createState() => _ImageDescriptorPageState();
}

class _ImageDescriptorPageState extends State<ImageDescriptorPage> {
  ApiService api = ApiService();
  CameraController? controller;
  XFile? imageFile;
  bool showCamera = false;
  ImageDescriptorModel? description;
  bool isYoruba = true;
  String dropdownValue = 'francais';

  Future<void> initCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    controller = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );

    if (!mounted) {
      return;
    }

    controller!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!showCamera) {
      return Center(
        child: ElevatedButton(
          child: Text('Open Camera'),
          onPressed: () {
            setState(() {
              showCamera = true;
            });
            initCamera();
          },
        ),
      );
    }

    if (controller == null || !controller!.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    if (imageFile != null) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFF0B4D00),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              setState(() {
                imageFile = null;
              });
            },
          ),
          title: const Text(
            "Description de l'image",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            Card(
              elevation: 10,
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  padding: const EdgeInsets.all(10),
                  child: Image.file(File(imageFile!.path))),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Description de l\'image",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(width: 10),
                //IconButton to read the text (speech to text). when button is cliked, show loading indicator at the place of the button, waiting for the response. WHEN THE RESPONSE IS READY, RE SHOW THE ICONBUTTON
                ReaderButton(textToRead: 'bonjour', language: 'yo'),
              ],
            ),
            const SizedBox(height: 10),
            //switch to change the language of the text between yo and fr

            DropdownButton<String>(
              value: dropdownValue,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>[
                'francais',
                'anglais',
                'espagnol',
                'yoruba',
                'fon'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: description != null
                      ? Text(
                          dropdownValue == 'francais'
                              ? description!.francais
                              : dropdownValue == 'anglais'
                                  ? description!.anglais
                                  : dropdownValue == 'espagnol'
                                      ? description!.espagnol
                                      : dropdownValue == 'yoruba'
                                          ? description!.yoruba
                                          : 'pas de données pour le moment',
                          style: const TextStyle(fontSize: 16),
                        )
                      : const CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: CameraPreview(controller!),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.camera),
        onPressed: () async {
          if (controller != null) {
            final image = await controller!.takePicture();
            setState(() {
              imageFile = image;
            });
            if (imageFile != null) {
              setState(() {
                description = null;
              });
              var result = await api.sendDescribeMonumentRequest(imageFile!);
              if (result != null) {
                ImageDescriptorModel desc = result;
                setState(() {
                  description = desc;
                });
              } else {
                print('sendDescribeMonumentRequest returned null');
              }
            } else {
              print('imageFile is null');
            }
          } else {
            print('controller is null');
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
