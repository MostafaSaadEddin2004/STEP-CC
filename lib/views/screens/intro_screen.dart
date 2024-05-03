import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:step_cc/models/intro_data_model.dart';
import 'package:step_cc/controller/utilities/check_locale.dart';
import 'package:step_cc/views/components/background_container.dart';
import 'package:step_cc/views/components/buttons/next_button.dart';
import 'package:step_cc/views/components/intro_content.dart';
import 'package:step_cc/views/screens/auth/sign_up_type_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});
  static const String id = '/IntroScreen';
  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
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
  void initState() {
    super.initState();
    _pageViewConterol.addListener(() {
      setState(() {
        if (_pageViewConterol.page == 3) {
          lastIndex = true;
        } else {
          lastIndex = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
          child: SafeArea(
              child: Padding(
        padding: EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 64),
        child: Column(children: [
          !lastIndex
              ? GestureDetector(
                  onTap: () {
                    _pageViewConterol.animateToPage(3,
                        duration: const Duration(seconds: 2),
                        curve: Curves.decelerate);
                  },
                  child: Row(
                    mainAxisAlignment: Direction.isLTR(context)
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [Text('Skip'), Icon(Icons.arrow_right_outlined)],
                  ))
              : const SizedBox(),
          SizedBox(
            height: !lastIndex ? 64 : 88,
          ),
          Image.asset('assets/images/logo.png'),
          Expanded(
            child: PageView.builder(
              itemCount: introData.length,
              controller: _pageViewConterol,
              itemBuilder: (context, index) {
                final data = introData[index];
                return Center(child: IntroContent(data: data));
              },
            ),
          ),
          Row(
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
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  if (lastIndex) {
                    Get.to(() => const SignUpTypeScreen(),
                        duration: const Duration(seconds: 1),
                        transition: Transition.cupertino);
                  } else {
                    _pageViewConterol.nextPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.decelerate);
                  }
                },
              )
            ],
          ),
        ]),
      ))),
    );
  }
}
