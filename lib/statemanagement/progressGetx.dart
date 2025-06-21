import 'package:get/get.dart';

class ProgressController extends GetxController {
  var currentStep = 0.obs; 
  var progressLineStep = 0.obs; 

  void preAdvanceLine() {
    if (progressLineStep.value < 3) {
      progressLineStep++;
    }
  }

  void goToNextStep() {
    if (currentStep.value < 3) {
      currentStep++;
    }
  }

  void goToPreviousStep() {
    if (currentStep.value > 0) {
      currentStep--;
    }
  }
}
