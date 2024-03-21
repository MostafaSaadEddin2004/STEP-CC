import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:step_cc/models/language_model.dart';

abstract class AppLocaization {
  static List<LanguageModel> languages = [
    LanguageModel(languageCode: 'eng', languageName: 'English'),
    LanguageModel(languageCode: 'ar', languageName: 'Arabic'),
  ];

  static Future<Locale> getLocale() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final String locale =  sharedPreferences.getString('locale') ?? 'en';
    return Locale(locale);
  }

  static Future<void> setLocale(Locale locale) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString('locale', locale.languageCode);
  }
}
