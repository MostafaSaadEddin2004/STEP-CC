import 'package:flutter/material.dart';

abstract class AppTheme{

  static get darkTheme  => ThemeData.dark(useMaterial3: true).copyWith();
  static get lighttheme => ThemeData.light(useMaterial3: true).copyWith();

} 