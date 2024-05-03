import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:step_cc/controller/l10n/app_localization.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationInitial()) {
    intitLocale();
  }

  void intitLocale() async {
    final locale = await AppLocalization.getLocale();
    emit(LocalizationFetched(locale: locale));
  }

  void setArabic() async {
    const locale = Locale('ar');
    await AppLocalization.setLocale(locale);
    emit(LocalizationFetched(locale: locale));
  }

  void setEnglish() async {
    const locale = Locale('en');
    await AppLocalization.setLocale(locale);
    emit(LocalizationFetched(locale: locale));
  }
}
