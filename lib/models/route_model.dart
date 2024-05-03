import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:step_cc/views/screens/auth/cc_login_screen.dart';
import 'package:step_cc/views/screens/auth/cc_signup_screen.dart';
import 'package:step_cc/views/screens/auth/sign_up_type_screen.dart';
import 'package:step_cc/views/screens/auth/vip_cc_login_screen.dart';
import 'package:step_cc/views/screens/auth/vip_cc_signup_screen.dart';
import 'package:step_cc/views/screens/intro_screen.dart';
import 'package:step_cc/views/screens/splash_screen.dart';

abstract class AppRoute {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.id:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case IntroScreen.id:
        return CupertinoPageRoute(
          builder: (context) => const IntroScreen(),
        );
      case SignUpTypeScreen.id:
        return MaterialPageRoute(
          builder: (context) => const SignUpTypeScreen(),
        );
      case CCSignUpScreen.id:
        return MaterialPageRoute(
          builder: (context) => const CCSignUpScreen(),
        );
      case CCLoginScreen.id:
        return MaterialPageRoute(
          builder: (context) => const CCLoginScreen(),
        );
      case VIPCCSignUpScreen.id:
        return CupertinoPageRoute(builder: (_) => const VIPCCSignUpScreen());
      case VIPCCLoginScreen.id:
        return MaterialPageRoute(
          builder: (context) => const VIPCCLoginScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
    }
  }
}
