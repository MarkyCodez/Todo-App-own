import 'package:flutter/material.dart';
import 'package:new_todo_app/theme/my_colors.dart';

class MyTheme {
  static ThemeData lightMode = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 23,
        color: MyColors.darkBackgroundColor,
      ),
    ),
    fontFamily: 'Manrope',
    brightness: Brightness.light,
    scaffoldBackgroundColor: MyColors.lightBackgroundColor,
    colorScheme: ColorScheme.light(
      primary: MyColors.lightMainColor,
      secondary: MyColors.lightDividerLines,
      onPrimary: MyColors.lightBackgroundColor,
      onSecondary: MyColors.lightComponentsColor,
    ),
  );
  static ThemeData darkMode = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 23,
      ),
    ),
    fontFamily: 'Manrope',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: MyColors.darkBackgroundColor,
    colorScheme: ColorScheme.dark(
      primary: MyColors.darkMainColor,
      secondary: MyColors.darkDividerLines,
      onPrimary: MyColors.darkBackgroundColor,
      onSecondary: MyColors.darkComponentsColor,
    ),
  );
}
