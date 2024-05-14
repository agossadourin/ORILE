import 'package:get/get.dart';

class VideoController extends GetxController {
  final Rx<List<String>> _videoList = Rx<List<String>>([
    'assets/videos/1.mp4',
    'assets/videos/2.mp4',
    'assets/videos/3.mp4',
  ]);

  List<String> get videoList => _videoList.value;
}
