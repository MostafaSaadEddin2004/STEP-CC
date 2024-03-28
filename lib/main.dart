import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:step_cc/bloc/localization_cubit/localization_cubit.dart';
import 'package:step_cc/bloc/theme_cubit/theme_cubit.dart';
import 'package:step_cc/models/bloc_observer.dart';
import 'package:step_cc/models/route_model.dart';
import 'package:step_cc/screens/splash_screen.dart';
import 'package:step_cc/theme/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const Main());
  Bloc.observer = MyBlocObserver();
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ThemeCubit(),
          ),
          BlocProvider(
            create: (context) => LocalizationCubit(),
          ),
        ],
        child: Builder(
          builder: (context) {
            final themeState =
                BlocProvider.of<ThemeCubit>(context, listen: true).state;
            final localeState =
                BlocProvider.of<LocalizationCubit>(context, listen: true).state;
            if (themeState is ThemeFetched &&
                localeState is LocalizationFetched) {
              return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('en'), // English
                  Locale('ar'), // Spanish
                ],
                locale: localeState.locale,
                theme: AppTheme.lightTheme(context),
                darkTheme: AppTheme.darkTheme(context),
                themeMode: themeState.themeMode,
                home: const SplashScreen(),
                onGenerateRoute: AppRoute.onGenerateRoute,
              );
            }
            return const SizedBox();
          },
        ));
  }
}
