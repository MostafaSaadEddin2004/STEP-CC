part of 'localization_cubit.dart';

@immutable
class LocalizationState {}

class LocalizationInitial extends LocalizationState {}

class LocalizationFetched extends LocalizationState {
  final Locale locale;

  LocalizationFetched({required this.locale});
}
