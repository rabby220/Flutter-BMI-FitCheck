import 'package:flutter/material.dart';

class AppText {
  ///App Bar Text
  static const TextStyle appBarTextStyle = TextStyle(
      color: Colors.white,
      fontSize: 23.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'poppins');

  ///Button Text Style
  static const TextStyle buttonTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    fontFamily: 'poppins',
  );

  ///TextFormField User input Colors
  static const TextStyle weightTextStyle = TextStyle(
    color: Colors.red,
    fontSize: 35.0,
    fontWeight: FontWeight.bold,
    fontFamily: 'digit',
  );

  static const TextStyle feetTextStyle = TextStyle(
    color: Colors.blue,
    fontSize: 35.0,
    fontWeight: FontWeight.bold,
    fontFamily: 'digit',
  );

  static const TextStyle inchTextStyle = TextStyle(
    color: Colors.orange,
    fontSize: 35.0,
    fontWeight: FontWeight.bold,
    fontFamily: 'digit',
  );

  ///male and female Text style
  static const TextStyle genderTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    fontFamily: 'poppins',
  );

  ///App Bar Text
  static const String appText = "BMI FitCheck";
  static const String appBarReportText = "BMI Test Report";

  ///Body Text
  static const String maleText = "Male";
  static const String femaleText = "Female";
  static const String calculateText = "Calculate";
  static const String weightHintText = "Enter Weight";
  static const String feetHintText = "Enter Feet";
  static const String inchHintText = "Enter Inch";

  ///Result text
  static const String backText = "Back";

  static const TextStyle gaugeAnnotationTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 40.0,
    fontWeight: FontWeight.bold,
    fontFamily: 'digit',
  );

  /// Text Input Validator Text
  static const String genderValidText = "Please Select Gender";
  static const String weightValidText = "Please Enter Weight";
  static const String feetValidText = "Please Enter Feet";
  static const String inchValidText = "Please Enter Inch";
}