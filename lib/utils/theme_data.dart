import 'package:demo_app/utils/colors.dart';
import 'package:demo_app/utils/font_mapper.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    textTheme: TextTheme(
      titleLarge: TextStyle(
          fontSize: 22, fontWeight: FontWeight.bold, fontFamily: FontFamily.openSansBold),
      bodyLarge: const TextStyle(fontSize: 18, color: Colors.black87),
      displaySmall: TextStyle(fontSize: 14, fontFamily: FontFamily.openSansMedium),
      displayLarge: TextStyle(fontSize: 18, fontFamily: FontFamily.openSansMedium),
      displayMedium: TextStyle(fontSize: 16, fontFamily: FontFamily.openSansMedium),
      titleSmall: TextStyle(fontSize: 20, fontFamily: FontFamily.openSansBold),
      labelSmall: TextStyle(fontSize: 16, fontFamily: FontFamily.openSansSemiBold),
      labelMedium: TextStyle(fontSize: 18, fontFamily: FontFamily.openSansSemiBold),
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.blue,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    colorScheme: ColorScheme.fromSeed(
        background: Colors.white,
        seedColor: Colors.purple,
        secondaryContainer: AppColors.secondaryContainer));

ThemeData darkTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    textTheme: TextTheme(
      titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          fontFamily: FontFamily.openSansBold,
          color: Colors.white),
      bodyLarge: const TextStyle(fontSize: 18, color: Colors.black87),
      displaySmall: TextStyle(fontSize: 14, fontFamily: FontFamily.openSansMedium),
      displayLarge: TextStyle(fontSize: 18, fontFamily: FontFamily.openSansMedium),
      displayMedium: TextStyle(fontSize: 16, fontFamily: FontFamily.openSansMedium),
      titleSmall: TextStyle(fontSize: 20, fontFamily: FontFamily.openSansBold),
      labelSmall: TextStyle(fontSize: 16, fontFamily: FontFamily.openSansSemiBold),
      labelMedium: TextStyle(fontSize: 18, fontFamily: FontFamily.openSansSemiBold),
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.blue,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    colorScheme: ColorScheme.fromSeed(
        background: Colors.black,
        seedColor: Colors.purple,
        secondaryContainer: AppColors.secondaryContainer));
