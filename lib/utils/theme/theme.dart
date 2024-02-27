import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'custom_themes/appBarTheme.dart';
import 'custom_themes/bottomSheetTheme.dart';
import 'custom_themes/elevatedButtonTheme.dart';
import 'custom_themes/textTheme.dart';

class HAppTheme {
  HAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: HColors.primary,
    scaffoldBackgroundColor: Colors.white,
    textTheme: HTextTheme.lightTextTheme,
    appBarTheme: HAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: HBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: HElevatedButtonTheme.lightElevatedButtonTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: HColors.primary,
    scaffoldBackgroundColor: Colors.black,
    textTheme: HTextTheme.darkTextTheme,
    appBarTheme: HAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: HBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: HElevatedButtonTheme.darkElevatedButtonTheme,
  );
}