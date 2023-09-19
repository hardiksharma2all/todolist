import 'package:flutter/material.dart';

class Dimension {
  ///Screen Size
  static Size size = (WidgetsBinding.instance.window.physicalSize /
      WidgetsBinding.instance.window.devicePixelRatio);
  static double screenHeight = size.height;
  static double screenWidth = size.width;

  ///Height Measurements
  static double height7 = screenHeight / 121.90;
  static double height10 = screenHeight / 85.333;
  static double height20 = screenHeight / 42.6665;
  static double height25 = screenHeight / 34.1332;
  static double height30 = screenHeight / 28.4443;
  static double height40 = screenHeight / 21.33325;
  static double height50 = screenHeight / 17.066;

  ///Width Measurements
  static double width3 = screenWidth / 128;
  static double width5 = screenWidth / 76.80;
  static double width7 = screenWidth / 54.85;
  static double width10 = screenWidth / 38.40;
  static double width15 = screenWidth / 25.60;
  static double width18 = screenWidth / 21.33;
  static double width20 = screenWidth / 19.2;
  static double width30 = screenWidth / 12.8;
  static double width50 = screenWidth / 7.68;

  ///Radius Measurements
  static double radius5 = screenWidth / 76.80;
  static double radius15 = screenWidth / 25.60;
  static double radius25 = screenWidth / 15.36;

  /// Font Size
  static double font10 = screenHeight / 85.333;
  static double font12 = screenHeight / 71.11;
  static double font15 = screenHeight / 56.888;
  static double font18 = screenHeight / 47.4072;
  static double font20 = screenHeight / 42.6665;
  static double font25 = screenHeight / 34.1332;

  ///Icon Size
  static double iconSize15 = screenHeight / 56.8886;
  static double iconSize24 = screenHeight / 35.5554;
}
