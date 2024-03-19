import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_cc/components/background_container.dart';
import 'package:step_cc/screens/intro/intro_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

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
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
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
    await Future.delayed(const Duration(seconds: 2), () {
      Get.off(() => const IntroPage(),
          transition: Transition.cupertino,
          duration: const Duration(seconds: 2));
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
