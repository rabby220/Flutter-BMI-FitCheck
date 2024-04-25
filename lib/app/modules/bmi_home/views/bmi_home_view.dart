import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_text.dart';
import '../controllers/bmi_home_controller.dart';
import 'bmi_result_view.dart';

class BmiHomeView extends GetView<BmiHomeController> {
  const BmiHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100.0,
        titleTextStyle: AppText.appBarTextStyle,
        shadowColor: Colors.deepOrange,
        elevation: 5.0,
        backgroundColor: Theme.of(context).primaryColorDark,
        title: const Text(AppText.appText),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: controller.selectMaleContainer,
                            child: Obx(
                                  () => Card(
                                shadowColor: Colors.orange,
                                elevation: 5.0,
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    border: Border.all(
                                      color:
                                      controller.maleContainerColor.value,
                                      width: 3,
                                    ),
                                  ),
                                  child: const Center(
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.male,
                                          color: AppColors.maleIconColor,
                                          size: 35.0,
                                        ),
                                        Text(
                                          AppText.maleText,
                                          style: AppText.genderTextStyle,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: controller.selectFemaleContainer,
                            child: Obx(
                                  () => Card(
                                shadowColor: Colors.orange,
                                elevation: 5.0,
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    border: Border.all(
                                      color:
                                      controller.femaleContainerColor.value,
                                      width: 2,
                                    ),
                                  ),
                                  child: const Center(
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.female,
                                          color: AppColors.femaleIconColor,
                                          size: 35.0,
                                        ),
                                        Text(
                                          AppText.femaleText,
                                          style: AppText.genderTextStyle,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),

                  ////////////////////  Weight ////////////////////////////
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      style: AppText.weightTextStyle,
                      controller: controller.weightController,
                      keyboardType: TextInputType.number,
                      clipBehavior: Clip.antiAlias,
                     /* inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],*/
                      decoration: const InputDecoration(
                        labelText: AppText.weightHintText,
                      ),
                    ),
                  ),

                  ////////////////////  Fit ////////////////////////////
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            style: AppText.feetTextStyle,
                            controller: controller.fitController,
                            keyboardType: TextInputType.number,
                            clipBehavior: Clip.antiAlias,
                           /* inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ],*/
                            decoration: const InputDecoration(
                              labelText: AppText.feetHintText,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 50.0,
                        ),

                        ////////////////////  Inch ////////////////////////////
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            style: AppText.inchTextStyle,
                            controller: controller.inchController,
                            keyboardType: TextInputType.number,
                            clipBehavior: Clip.antiAlias,
                           /* inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ],*/
                            decoration: const InputDecoration(
                              labelText: AppText.inchHintText,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),

                  ////////////////////  Calculate ////////////////////////////
                  MaterialButton(
                    color: Theme.of(context).primaryColorDark,
                    minWidth: double.maxFinite,
                    height: 50.0,
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {
                      if (!controller.isMaleSelected &&
                          !controller.isFemaleSelected) {
                        inputBarStyle(AppText.genderValidText, '');
                      } else if (controller.weightController.text.isEmpty) {
                        inputBarStyle(AppText.weightValidText, '');
                      } else if (controller.fitController.text.isEmpty) {
                        inputBarStyle(AppText.feetValidText, '');
                      } else if (controller.inchController.text.isEmpty) {
                        inputBarStyle(AppText.inchValidText, '');
                      } else {
                        controller.bmiCalculator();
                        Get.to(BmiResultView());
                      }
                    },
                    child: const Text(
                      AppText.calculateText,
                      style: AppText.buttonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SnackbarController inputBarStyle(String titleText, String subTitle) {
    return Get.snackbar(
      titleText,
      subTitle,
      snackPosition: SnackPosition.BOTTOM,
      overlayBlur: 4.0,
      snackStyle: SnackStyle.FLOATING,
      borderRadius: 10.0,
      colorText: AppColors.shadowMaleColor,
      duration: const Duration(seconds: 1),
      animationDuration: const Duration(seconds: 1),
    );
  }
}