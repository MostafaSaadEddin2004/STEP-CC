import 'package:flutter/material.dart';

abstract class Direction {
  static bool isLTR(BuildContext context) =>
    Localizations.localeOf(context).languageCode == 'en';
}
