import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_cc/constants/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
              secondary: black,
              onSecondary: blue,
              error: red,
              onError: red,
              background: black,
              onBackground: darkBlue,
              surface: lightlue,
              onSurface: grey),
          textTheme: TextTheme(
            labelLarge: GoogleFonts.literata(
              fontSize: 28,
              color: white,
              fontWeight: FontWeight.bold,
            ),
            labelMedium: GoogleFonts.literata(
              fontSize: 24,
              color: white,
              fontWeight: FontWeight.bold,
            ),
            labelSmall: GoogleFonts.literata(
              fontSize: 20,
              color: white,
              fontWeight: FontWeight.bold,
            ),
            titleLarge: GoogleFonts.literata(
              fontSize: 28,
              color: black,
              fontWeight: FontWeight.bold,
            ),
            titleMedium: GoogleFonts.literata(
              fontSize: 24,
              color: black,
              fontWeight: FontWeight.bold,
            ),
            titleSmall: GoogleFonts.literata(
              fontSize: 20,
              color: black,
              fontWeight: FontWeight.bold,
            ),
            bodyLarge: GoogleFonts.literata(
              fontSize: 20,
              color: white,
              fontWeight: FontWeight.bold,
            ),
            bodyMedium: GoogleFonts.literata(
              fontSize: 16,
              color: white,
              fontWeight: FontWeight.normal,
            ),
            bodySmall: GoogleFonts.literata(
              fontSize: 12,
              color: white,
              fontWeight: FontWeight.normal,
            ),
            displayLarge: GoogleFonts.literata(
              fontSize: 20,
              color: black,
              fontWeight: FontWeight.normal,
            ),
            displayMedium: GoogleFonts.literata(
              fontSize: 16,
              color: black,
              fontWeight: FontWeight.normal,
            ),
            displaySmall: GoogleFonts.literata(
              fontSize: 12,
              color: black,
              fontWeight: FontWeight.normal,
            ),
          ));

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
          textTheme: TextTheme(
            labelLarge: GoogleFonts.literata(
              fontSize: 28,
              color: black,
              fontWeight: FontWeight.bold,
            ),
            labelMedium: GoogleFonts.literata(
              fontSize: 24,
              color: black,
              fontWeight: FontWeight.bold,
            ),
            labelSmall: GoogleFonts.literata(
              fontSize: 20,
              color: black,
              fontWeight: FontWeight.bold,
            ),
            titleLarge: GoogleFonts.literata(
              fontSize: 28,
              color: white,
              fontWeight: FontWeight.bold,
            ),
            titleMedium: GoogleFonts.literata(
              fontSize: 24,
              color: white,
              fontWeight: FontWeight.bold,
            ),
            titleSmall: GoogleFonts.literata(
              fontSize: 20,
              color: white,
              fontWeight: FontWeight.bold,
            ),
            bodyLarge: GoogleFonts.literata(
              fontSize: 20,
              color: black,
              fontWeight: FontWeight.bold,
            ),
            bodyMedium: GoogleFonts.literata(
              fontSize: 16,
              color: black,
              fontWeight: FontWeight.normal,
            ),
            bodySmall: GoogleFonts.literata(
              fontSize: 12,
              color: black,
              fontWeight: FontWeight.normal,
            ),
            displayLarge: GoogleFonts.literata(
              fontSize: 20,
              color: white,
              fontWeight: FontWeight.normal,
            ),
            displayMedium: GoogleFonts.literata(
              fontSize: 16,
              color: white,
              fontWeight: FontWeight.normal,
            ),
            displaySmall: GoogleFonts.literata(
              fontSize: 12,
              color: black,
              fontWeight: FontWeight.normal,
            ),
          ));
  
  static Future<ThemeMode> getThemeMode() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final themeMode = sharedPreferences.getString('theme') ?? ThemeMode.system.name;
    switch (themeMode) {
      case 'dark':
        return ThemeMode.dark;
      case 'light':
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  static Future<void> setThemeMode(ThemeMode mode) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('theme', mode.name);
  }
}
