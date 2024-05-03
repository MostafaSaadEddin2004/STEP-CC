import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:step_cc/controller/theme/app_theme.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial()){
    intitThemeMode();
  }

  void intitThemeMode() async {
    final themeMode = await AppTheme.getThemeMode();
    emit(ThemeFetched(themeMode: themeMode));
  }

  void setDarkMode() async {
    const darkTheme = ThemeMode.dark;
    await AppTheme.setThemeMode(darkTheme);
    emit(ThemeFetched(themeMode: darkTheme));
  }

  void setLightMode() async {
    const lightTheme = ThemeMode.light;
    await AppTheme.setThemeMode(lightTheme);
    emit(ThemeFetched(themeMode: lightTheme));
  }
}
