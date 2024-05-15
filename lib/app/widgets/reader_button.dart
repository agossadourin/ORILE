import 'package:flutter/material.dart';

class ReaderButton extends StatefulWidget {
  final String? textToRead;
  final String? language;
  const ReaderButton(
      {super.key, required this.textToRead, required this.language});

  @override
  State<ReaderButton> createState() => _ReaderButtonState();
}

class _ReaderButtonState extends State<ReaderButton> {
  Future<String>? _future;

  Future<String> _performSpeechToText() async {
    // Replace this with your actual speech to text function
    await Future.delayed(Duration(seconds: 2)); // Simulate a delay
    return 'Hello, World!';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _future == null
          ? IconButton(
              icon: Icon(Icons.volume_up),
              onPressed: () {
                setState(() {
                  _future = _performSpeechToText();
                });
              },
            )
          : FutureBuilder<String>(
              future: _future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else {
                  _future = null; // Reset the future
                  return IconButton(
                    icon: Icon(Icons.volume_up),
                    onPressed: () {
                      setState(() {
                        _future = _performSpeechToText();
                      });
                    },
                  );
                }
              },
            ),
    );
  }
}
