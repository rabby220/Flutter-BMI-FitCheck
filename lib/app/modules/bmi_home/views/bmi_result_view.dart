import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_text.dart';
import '../controllers/bmi_home_controller.dart';

class BmiResultView extends GetView {
   BmiResultView({super.key});

  final BmiHomeController homes = Get.put(BmiHomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        titleTextStyle: AppText.appBarTextStyle,
        shadowColor: AppColors.shadowAppbarColor,
        elevation: 5.0,
        backgroundColor: Theme.of(context).primaryColorDark,
        title: const Text(AppText.appBarReportText),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
                child: SfRadialGauge(
                  enableLoadingAnimation: true,
                  animationDuration: 2000,
                  //RadialAxis
                  axes: <RadialAxis>[
                    RadialAxis(
                      labelFormat: '',
                      interval: 1.0,
                      //Gauge Annotation
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                          widget: Container(
                            child: Text(
                              homes.calculateBmi.toString(),
                              style: AppText.gaugeAnnotationTextStyle,
                            ),
                          ),
                          angle: 90,
                          positionFactor: 0.5,
                        ),
                      ],

                      //Gauge Pointers
                      pointers: <GaugePointer>[
                        NeedlePointer(
                          value: homes.calculateBmi.value,
                          animationType: AnimationType.linear,
                          needleColor: Colors.orange,
                          knobStyle: const KnobStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                      minimum: 0,
                      maximum: 40,

                      //Gauge Ranges
                      ranges: [
                        GaugeRange(
                          startValue: 0,
                          endValue: 18.5,
                          color: Colors.red,
                          startWidth: 45,
                          endWidth: 45,
                        ),
                        GaugeRange(
                          startValue: 18.5,
                          endValue: 25,
                          color: Colors.green,
                          startWidth: 45,
                          endWidth: 45,
                        ),
                        GaugeRange(
                          startValue: 25,
                          endValue: 30,
                          color: Colors.blue,
                          startWidth: 45,
                          endWidth: 45,
                        ),
                        GaugeRange(
                          startWidth: 45,
                          endWidth: 45.0,
                          startValue: 30,
                          endValue: 40, //////////////////////////
                          color: Colors.yellow,
                        ),
                      ],
                    ),
                  ],

                  //GaugeTitle
                  title: GaugeTitle(
                      alignment: GaugeAlignment.center,
                      text: homes.bmiResult.value,
                      textStyle: AppText.genderTextStyle),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: MaterialButton(
                  onPressed: () {
                    Get.back();
                  },
                  color: Theme.of(context).primaryColorDark,
                  minWidth: double.maxFinite,
                  height: 50.0,
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Text(
                    AppText.backText,
                    style: AppText.buttonTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
