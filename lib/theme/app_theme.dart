import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_cc/constants/colors.dart';

abstract class AppTheme {
  static ThemeData darkTheme(BuildContext context) {
    return ThemeData.dark(useMaterial3: true).copyWith(
      appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.red,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.light)),
      colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Colors.black,
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
        labelLarge: GoogleFonts.literata(
          fontSize: 28,
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
        labelMedium: GoogleFonts.literata(
          fontSize: 24,
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
        labelSmall: GoogleFonts.literata(
          fontSize: 20,
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: GoogleFonts.literata(
          fontSize: 28,
          color: Theme.of(context).colorScheme.secondary,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: GoogleFonts.literata(
          fontSize: 24,
          color: Theme.of(context).colorScheme.secondary,
          fontWeight: FontWeight.bold,
        ),
        titleSmall: GoogleFonts.literata(
          fontSize: 20,
          color: Theme.of(context).colorScheme.secondary,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: GoogleFonts.literata(
          fontSize: 20,
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: GoogleFonts.literata(
          fontSize: 16,
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.normal,
        ),
        bodySmall: GoogleFonts.literata(
          fontSize: 12,
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.normal,
        ),
        displayLarge: GoogleFonts.literata(
          fontSize: 20,
          color: Theme.of(context).colorScheme.secondary,
          fontWeight: FontWeight.normal,
        ),
        displayMedium: GoogleFonts.literata(
          fontSize: 16,
          color: Theme.of(context).colorScheme.secondary,
          fontWeight: FontWeight.normal,
        ),
        displaySmall: GoogleFonts.literata(
          fontSize: 12,
          color: Theme.of(context).colorScheme.secondary,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

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
