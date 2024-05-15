import 'package:etourist/app/modules/principal/tools_box/translate/audio_play_page.dart';
import 'package:etourist/app/modules/principal/tools_box/translate/translate_page.dart';
import 'package:etourist/app/widgets/action_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageSelectionWidget extends StatefulWidget {
  @override
  _LanguageSelectionWidgetState createState() =>
      _LanguageSelectionWidgetState();
}

class _LanguageSelectionWidgetState extends State<LanguageSelectionWidget> {
  String selectedLanguage1 = 'English'; // Default value for language 1
  String selectedLanguage2 = 'French'; // Default value for language 2

  List<String> languages = [
    'English',
    'French',
    'Spanish',
    'German',
    'Chinese'
  ]; // List of available languages

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Traducteur'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Choisissez la langue de départ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF0B4D00),
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                ),
              ),
              DropdownButton<String>(
                value: selectedLanguage1,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedLanguage1 = newValue!;
                  });
                },
                items: languages.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Text(
                'Choisissez la langue de départ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF0B4D00),
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              DropdownButton<String>(
                value: selectedLanguage2,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedLanguage2 = newValue!;
                  });
                },
                items: languages.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                    enabled: value != selectedLanguage1,
                  );
                }).toList(),
              ),
              SizedBox(
                height: 30,
              ),
              ActionButton(
                  action: 'Suivant',
                  onPressed: () {
                    /*Get.to(
                      () => TranslatePage(
                        startLanguage: selectedLanguage1,
                        endLanguage: selectedLanguage2)
                        
                        );*/

                    Get.to(() => AudioPlayPage());
                  })
            ],
          ),
        ),
      ),
    );
  }
}
