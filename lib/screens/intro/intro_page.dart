import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:step_cc/components/background_container.dart';
import 'package:step_cc/components/buttons/next_button.dart';
import 'package:step_cc/models/intro_data_model.dart';
import 'package:step_cc/screens/auth/sign_up_type_screen.dart';
import 'package:step_cc/screens/intro/intro_content.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final _pageViewConterol = PageController();
  final List<IntroDataModel> introData = [
    IntroDataModel(
        title: 'Make your own content',
        content:
            'The application supports advertisements and special content for subscribers, and their content will be promoted in the application, and you can reap your profits from your skill in creating content.'),
    IntroDataModel(
        title: 'Share your purposeful content',
        content:
            'The application will be the primary support for purposeful content creators on social media platforms.'),
    IntroDataModel(
        title: 'Be in charge',
        content:
            'The content must not contain any religious fallacies, ethnic, political, pornographic or bullying.'),
    IntroDataModel(
        title: 'Content creator types',
        content: """There are two types of login:
1- VIP content creator, payment must be made in this category to publish ads.
2- Regular content creator, the content creator completes certain tasks within a specific time frame to publish ads in this category."""),
  ];
  bool lastIndex = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
          child: SafeArea(
              child: Stack(children: [
        Positioned(
            left: 0,
            right: 0,
            top: 48,
            child: Image.asset('assets/images/logo.png')),
        PageView.builder(
          onPageChanged: (value) {
            setState(() {
              lastIndex = (value == 3);
            });
          },
          itemCount: introData.length,
          controller: _pageViewConterol,
          itemBuilder: (context, index) {
            final data = introData[index];
            return Center(child: IntroContent(data: data));
          },
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 48),
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SmoothPageIndicator(
                  effect: ExpandingDotsEffect(
                      expansionFactor: 2.0,
                      activeDotColor: Theme.of(context).colorScheme.onSecondary,
                      dotColor: Theme.of(context).colorScheme.onSurface),
                  controller: _pageViewConterol,
                  count: introData.length),
              NextButton(
                onPressed: () {
                  if (lastIndex) {
                    Get.to(() => const SignUpTypeScreen(),
                        duration: const Duration(seconds: 2),
                        transition: Transition.circularReveal);
                  } else {
                    _pageViewConterol.nextPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.decelerate);
                  }
                },
              )
            ],
          ),
        ),
        lastIndex == false
            ? Positioned(
                right: 16,
                top: 16,
                child: GestureDetector(
                    onTap: () {
                      _pageViewConterol.animateToPage(3,
                          duration: const Duration(seconds: 2),
                          curve: Curves.decelerate);
                    },
                    child: const Row(
                      children: [
                        Text('Skip'),
                        Icon(Icons.arrow_right_outlined)
                      ],
                    )),
              )
            : const SizedBox()
      ]))),
    );
  }
}
