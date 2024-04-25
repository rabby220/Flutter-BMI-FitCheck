import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BmiHomeController extends GetxController {
  /// Container Gender...>>>>>>>>
  Rx<Color> maleContainerColor = Colors.transparent.obs;
  Rx<Color> femaleContainerColor = Colors.transparent.obs;

  bool isMaleSelected = false;
  bool isFemaleSelected = false;

  void selectMaleContainer() {
    maleContainerColor.value = Colors.blue;
    femaleContainerColor.value = Colors.transparent;
    isMaleSelected = true;
    isFemaleSelected = false;
  }

  void selectFemaleContainer() {
    maleContainerColor.value = Colors.transparent;
    femaleContainerColor.value = Colors.pink;
    isMaleSelected = false;
    isFemaleSelected = true;
  }

  /// User Input
  TextEditingController weightController = TextEditingController();
  TextEditingController fitController = TextEditingController();
  TextEditingController inchController = TextEditingController();

  RxString bmiResult = ''.obs;
  RxDouble calculateBmi = 0.0.obs;

  void bmiCalculator() {
    try {
      double oneMeter = 0.0254;
      int weight = int.parse(weightController.text);
      int fit = int.parse(fitController.text);
      int inch = int.parse(inchController.text);
      int totalInch = (fit * 12) + inch;
      double meter = totalInch * oneMeter;
      double calculateBmiValue = (weight / pow(meter, meter));
      calculateBmi.value = calculateBmiValue.toPrecision(1);

      if (calculateBmi < 18.5) {
        bmiResult.value = 'Under Weight';
        print('');
      } else if (calculateBmi >= 18.5 && calculateBmi < 25) {
        bmiResult.value = 'Normal';
      } else if (calculateBmi >= 25 && calculateBmi < 30) {
        bmiResult.value = 'Over Weight';
      } else if (calculateBmi >= 30 && calculateBmi < 35) {
        bmiResult.value = 'obese';
      } else {
        bmiResult.value = 'Extremely obese';
      }
    } catch (e) {
      Get.snackbar('Program Error', '', snackPosition: SnackPosition.BOTTOM);
    }
  }
}
