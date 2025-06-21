import 'package:get/get.dart';

class ProgressController extends GetxController {
  var currentStep = 0.obs;

  void nextStep() {
    if (currentStep < 3) {
      currentStep++;
    }
  }

  void previousStep() {
    if (currentStep > 0) {
      currentStep--;
    }
  }
}
