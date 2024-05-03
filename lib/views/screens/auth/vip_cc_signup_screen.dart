import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:step_cc/views/components/background_container.dart';
import 'package:step_cc/views/components/buttons/back_button.dart';
import 'package:step_cc/views/components/buttons/log_in_button.dart';
import 'package:step_cc/views/components/buttons/register_icon_button.dart';
import 'package:step_cc/views/components/text%20fields/phone_text_field.dart';
import 'package:step_cc/views/components/text%20fields/text_field.dart';
import 'package:step_cc/views/screens/auth/vip_cc_login_screen.dart';

class VIPCCSignUpScreen extends StatefulWidget {
  const VIPCCSignUpScreen({super.key});
  static const String id = '/VIPCCSignUpScreen';

  @override
  State<VIPCCSignUpScreen> createState() => _VIPCCSignUpScreenState();
}

class _VIPCCSignUpScreenState extends State<VIPCCSignUpScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formState = GlobalKey();
  @override
  void dispose() {
    super.dispose();
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formState,
        child: SafeArea(
            child: BackgroundContainer(
                child: SingleChildScrollView(
          child: Column(
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
                height: 8,
              ),
              Text(
                'Sign up',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.05)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomTextField(
                      obscure: false,
                      controller: _userNameController,
                      validator: (text) {
                        if (text!.isEmpty) {
                          return 'this filed is required';
                        }
                        return null;
                      },
                      maxLine: 1,
                      prefix: const Icon(Icons.person),
                      hint: 'Enter username',
                      labelText: 'Username',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      obscure: false,
                      controller: _emailController,
                      validator: (text) {
                        if (text!.isEmpty) {
                          return 'this filed is required';
                        }
                        return null;
                      },
                      maxLine: 1,
                      prefix: const Icon(Icons.email),
                      hint: 'Enter email',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      obscure: false,
                      controller: _passwordController,
                      validator: (text) {
                        if (text!.isEmpty) {
                          return 'this filed is required';
                        }
                        return null;
                      },
                      maxLine: 1,
                      prefix: const Icon(Icons.lock),
                      hint: 'Enter password',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    PhoneTextField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      hint: 'Enter phone',
                      labelText: 'Phone',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    LogInTextButton(
                      onTap: () {
                        Get.to(() => const VIPCCLoginScreen());
                      },
                      buttonText: 'Sign up',
                    )
                  ],
                ),
              ),
              Text(
                'Or sign up with',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.05)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RegisterIconButton(
                          onTap: () {},
                          icon: FontAwesomeIcons.facebookF,
                        ),
                        RegisterIconButton(
                          onTap: () {},
                          icon: FontAwesomeIcons.google,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Already have an account?',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        TextButton(
                            onPressed: () {
                              Get.off(() => const VIPCCLoginScreen(),
                                  duration: const Duration(seconds: 2),
                                  transition: Transition.circularReveal);
                            },
                            child: Text(
                              'Log in',
                              style: Theme.of(context).textTheme.headlineLarge,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ))),
      ),
    );
  }
}
