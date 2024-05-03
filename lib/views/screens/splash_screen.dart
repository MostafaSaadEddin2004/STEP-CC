import 'package:flutter/material.dart';
import 'package:step_cc/views/components/background_container.dart';
import 'package:step_cc/views/screens/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String id = '/';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(animationController);
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  void aniateAndPushScreen() async {
    animationController
      ..reset()
      ..forward();
    await Future.delayed(const Duration(seconds: 3), () {
      // Get.off(() => const IntroScreen(),
      //     transition: Transition.cupertino,
      //     duration: const Duration(seconds: 3));
      Navigator.of(context).popAndPushNamed(IntroScreen.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    aniateAndPushScreen();
    return Scaffold(
      body: BackgroundContainer(
        child: Center(
          child: FadeTransition(
            opacity: animation,
            child: ScaleTransition(
                filterQuality: FilterQuality.none,
                scale: animation,
                alignment: Alignment.center,
                child: Image.asset('assets/images/logo.png')),
          ),
        ),
      ),
    );
  }
}
