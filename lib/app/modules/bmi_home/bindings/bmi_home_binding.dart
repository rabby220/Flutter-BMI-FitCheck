import 'package:get/get.dart';

import '../controllers/bmi_home_controller.dart';

class BmiHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BmiHomeController>(
      () => BmiHomeController(),
    );
  }
}
