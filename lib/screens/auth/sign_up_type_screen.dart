import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:step_cc/components/background_container.dart';
import 'package:step_cc/components/buttons/back_button.dart';
import 'package:step_cc/components/buttons/next_button.dart';
import 'package:step_cc/components/buttons/sign_up_type_button.dart';
import 'package:step_cc/screens/auth/cc_signup_screen.dart';
import 'package:step_cc/screens/auth/vip_cc_signup_screen.dart';

class SignUpTypeScreen extends StatefulWidget {
  const SignUpTypeScreen({super.key});
  static const String id = '/SignUpTypeScreen';
  @override
  State<SignUpTypeScreen> createState() => _SignUpTypeScreenState();
}

class _SignUpTypeScreenState extends State<SignUpTypeScreen> {
  bool isVIP = true;
  bool isNotVIP = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
          child: SafeArea(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              CustomBackButton(
                onTap: () {
                  Get.back();
                },
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Image.asset('assets/images/logo.png'),
          const SizedBox(
            height: 32,
          ),
          Text(
            'Select sign up type',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          SignUpTypeButton(
            onTap: () {
              setState(() {
                isVIP = true;
                isNotVIP = false;
              });
            },
            isVIP: isVIP,
            text: 'VIP Content Creator',
          ),
          SignUpTypeButton(
            onTap: () {
              setState(() {
                isVIP = false;
                isNotVIP = true;
              });
            },
            isVIP: isNotVIP,
            text: 'Content Creator',
          ),
          const Spacer(
            flex: 1,
          ),
          NextButton(
            onPressed: () {
              if (isVIP) {
                Get.to(() => const VIPCCSignUpScreen(),
                    duration: const Duration(seconds: 1),
                    transition: Transition.fadeIn);
              } else {
                Get.to(() => const CCSignUpScreen(),
                    duration: const Duration(seconds: 2),
                    transition: Transition.fadeIn);
              }
            },
          ),
        ],
      ))),
    );
  }
}
