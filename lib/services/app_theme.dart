import 'package:flutter/material.dart';
import 'package:todolist/utils/colors.dart';

enum AppTheme { darkTheme, lightTheme }

class AppThemes {
  static final appThemeData = {
    AppTheme.darkTheme: ThemeData(
      // iconTheme: IconThemeData(
      //   size: Dimension.iconSize24,
      // ),
      primaryColor: Colors.black,
      dividerColor: Colors.black54,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.mainColor,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
      textTheme: const TextTheme(
        titleMedium: TextStyle(color: Colors.white),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.mainColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black54),
      colorScheme: ColorScheme.fromSwatch(
              primarySwatch: buildMaterialColor(const Color(0xFFE91E63)))
          .copyWith(
              background: const Color(0xFF212121), brightness: Brightness.dark),
    ),

    //
    //

    AppTheme.lightTheme: ThemeData(
      primaryColor: Colors.white,
      // brightness: Brightness.light,
      dividerColor: const Color(0xff757575),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.black),
        ),
      ),
      textTheme: const TextTheme(
        titleMedium: TextStyle(color: Colors.black),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black54),
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
          background: const Color(0xFFE5E5E5), brightness: Brightness.light),
    ),
  };
}
