import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:step_cc/constants/colors.dart';

abstract class AppTheme {
  static ThemeData darkTheme(BuildContext context) =>
      ThemeData.dark(useMaterial3: true).copyWith(
        appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.red,
                statusBarBrightness: Brightness.dark,
                statusBarIconBrightness: Brightness.light)),
        colorScheme: const ColorScheme(
            brightness: Brightness.dark,
            primary: black,
            onPrimary: darkBlue,
            secondary: white,
            onSecondary: blue,
            error: red,
            onError: red,
            background: black,
            onBackground: darkBlue,
            surface: lightlue,
            onSurface: grey),
        textTheme: TextTheme(
          labelLarge: TextStyle(
              fontSize: 32, color: Theme.of(context).colorScheme.primary),
        ),
      );
  static ThemeData lightTheme(BuildContext context) =>
      ThemeData.light(useMaterial3: true).copyWith(
        colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: white,
            onPrimary: blue,
            secondary: black,
            onSecondary: darkBlue,
            error: red,
            onError: red,
            background: white,
            onBackground: blue,
            surface: lightlue,
            onSurface: grey),
      );
}
