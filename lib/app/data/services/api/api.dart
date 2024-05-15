import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:etourist/app/data/models/image_description_model.dart';
import 'package:etourist/app/data/models/translated_audio.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class ApiService {
  String baseUrl =
      'http://ec2-3-8-117-75.eu-west-2.compute.amazonaws.com:8000/';

  Future<void> sendTextFrToTextYoRequest() async {
    try {
      var url = Uri.parse(
          'http://ec2-3-8-117-75.eu-west-2.compute.amazonaws.com:8000/texte_fr_to_texte_yo/?texte=bonjour');
      var response = await http.post(
        url,
        headers: {'accept': 'application/json'}, // Setting accept header
        body: {}, // Empty body
      );

      if (response.statusCode == 200) {
        print('Request successful!');
        print('Response body: ${response.body}');
      } else {
        print('Failed to send request. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error sending request: $e');
    }
  }

  Future<void> sendAudioFrToTextFrRequest(String path) async {
    try {
      var url = Uri.parse(
          'http://ec2-3-8-117-75.eu-west-2.compute.amazonaws.com:8000/audio_to_text/');
      var request = http.MultipartRequest('POST', url);

      // Add headers
      request.headers.addAll({'accept': 'application/json'});

      // Add audio file
      request.files.add(await http.MultipartFile.fromPath(
        'file',
        path, // Path to your audio file
        contentType: MediaType('audio', 'm4a'), // Set content type to audio/wav
      ));

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        print('Request successful!');
        print('Response body: ${response.body}');
      } else {
        print('Failed to send request. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error sending request: $e');
    }
  }

  Future<void> sendTextEnToTextFrRequest(String text) async {
    try {
      var url = Uri.parse(
          'http://ec2-3-8-117-75.eu-west-2.compute.amazonaws.com:8000/texte_en_to_texte_fr/?texte=$text');
      var response = await http.post(
        url,
        headers: {'accept': 'application/json'},
      );

      if (response.statusCode == 200) {
        print('Translation successful!');
        print('Translated text: ${response.body}');
      } else {
        print('Failed to translate text. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error translating text: $e');
    }
  }

  Future<void> sendTextFrToTextEnRequest(String text) async {
    try {
      var url = Uri.parse(
          'http://ec2-3-8-117-75.eu-west-2.compute.amazonaws.com:8000/texte_fr_to_texte_en/?texte=$text');
      var response = await http.post(
        url,
        headers: {'accept': 'application/json'},
      );

      if (response.statusCode == 200) {
        print('Traduction réussie!');
        print('Texte traduit: ${response.body}');
      } else {
        print(
            'Échec de la traduction du texte. Code de statut: ${response.statusCode}');
      }
    } catch (e) {
      print('Erreur lors de la traduction du texte: $e');
    }
  }

  Future<void> sendTextYoToTextFr(String text) async {
    try {
      var url = Uri.parse(
          'http://ec2-3-8-117-75.eu-west-2.compute.amazonaws.com:8000/texte_yo_to_texte_fr/?texte=$text');
      var response = await http.post(
        url,
        headers: {'accept': 'application/json'},
      );

      if (response.statusCode == 200) {
        print('Traduction réussie!');
        print('Texte traduit: ${response.body}');
      } else {
        print(
            'Échec de la traduction du texte. Code de statut: ${response.statusCode}');
      }
    } catch (e) {
      print('Erreur lors de la traduction du texte: $e');
    }
  }

  Future<ImageDescriptorModel> sendDescribeMonumentRequest(
      XFile imageFile) async {
    try {
      var url = Uri.parse(
          'http://ec2-3-8-117-75.eu-west-2.compute.amazonaws.com:8000/describe_monument');

      var request = http.MultipartRequest('POST', url);
      request.headers.addAll({'accept': 'application/json'});
      request.headers['Content-Type'] = 'multipart/form-data';

      File file = File(imageFile.path);

      request.files.add(http.MultipartFile(
        'file',
        file.readAsBytes().asStream(),
        file.lengthSync(),
        filename: 'decorator.png',
        contentType: MediaType('image', 'png'),
      ));

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        print('Description du monument réussie!');
        print('Description: ${response.body}');
        return ImageDescriptorModel.fromJson(jsonDecode(response.body));
      } else {
        print(
            'Échec de la description du monument. Code de statut: ${response.statusCode}');
        return ImageDescriptorModel.fromJson({});
      }
    } catch (e) {
      print('Erreur lors de la description du monument: $e');
      return ImageDescriptorModel.fromJson({});
    }
  }

  Future<String> sendAudioFrToSignRequest(String path) async {
    try {
      var url = Uri.parse(
          'http://ec2-34-233-172-219.compute-1.amazonaws.com:8000/audio_to_sign/');
      var request = http.MultipartRequest('POST', url);

      // Add headers
      request.headers.addAll({
        'accept': 'application/json',
        // 'Content-Type': 'multipart/form-data', // No need to set this header explicitly
      });

      // Add audio file
      request.files.add(await http.MultipartFile.fromPath(
        'file',
        path, // Path to your audio file
        contentType: MediaType('audio', 'ogg'), // Set content type to audio/ogg
      ));

      // Add form data
      request.fields['genre'] = '0';

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        print('Request successful!');
        print('Response body: ${response.body}');
        Map<String, dynamic> json = jsonDecode(response.body);
        return json["video_url"];
      } else {
        print('Failed to send request. Status code: ${response.statusCode}');
        return '';
      }
    } catch (e) {
      print('Error sending request: $e');
      return '';
    }
  }

  Future<TranslatedAudio> sendAudioYoToAudioFrRequest(
      String val, String path) async {
    String u = '';
    if (val == 'Francais - Yoruba') {
      u = 'http://ec2-3-8-117-75.eu-west-2.compute.amazonaws.com:8000/audio_fr_to_audio_yo';
    } else {
      u = 'http://ec2-3-8-117-75.eu-west-2.compute.amazonaws.com:8000/audio_yo_to_audio_fr/';
    }
    try {
      var url = Uri.parse(u);
      var request = http.MultipartRequest('POST', url);

      // Add headers
      request.headers.addAll({
        'accept': 'application/json',
        // 'Content-Type': 'multipart/form-data', // No need to set this header explicitly
      });

      // Add audio file
      request.files.add(await http.MultipartFile.fromPath(
        'file',
        path, // Path to your audio file
        contentType: MediaType('audio', 'ogg'), // Set content type to audio/ogg
      ));

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        return TranslatedAudio.fromJson(json);
      } else {
        print('Failed to send request. Status code: ${response.statusCode}');
        return TranslatedAudio.fromJson({});
      }
    } catch (e) {
      print('Error sending request: $e');
      return TranslatedAudio.fromJson({});
    }
  }
}
