import 'package:get/get.dart';

class LearnController extends GetxController {
  RxInt language = 0.obs;
  Rx<List<String>> languageList =
      Rx<List<String>>(['Fon', 'Yoruba', 'Dendi', 'Adja']);

  RxInt subject = 0.obs;
  Rx<List<String>> subjectList =
      Rx<List<String>>(['salutation', 'nombre', 'marche']);

  Rx<List<String>> translatedValues = Rx<List<String>>(
      ['ku do gbada', 'gandji', 'e ka lè', 'O dara', '', '', '', '']);
}
