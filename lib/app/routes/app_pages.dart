import 'package:get/get.dart';

import '../modules/bmi_home/bindings/bmi_home_binding.dart';
import '../modules/bmi_home/views/bmi_home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.BMI_HOME;

  static final routes = [
    GetPage(
      name: _Paths.BMI_HOME,
      page: () => const BmiHomeView(),
      binding: BmiHomeBinding(),
    ),
  ];
}
