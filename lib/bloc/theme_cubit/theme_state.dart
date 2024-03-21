part of 'theme_cubit.dart';

@immutable
class ThemeState {}

class ThemeInitial extends ThemeState {}

class ThemeFetched extends ThemeState {
  final ThemeMode themeMode;

  ThemeFetched({required this.themeMode});
}
