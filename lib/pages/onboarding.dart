import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trip_budgeter/pages/Onboarding/page_one.dart';
import 'package:trip_budgeter/pages/Onboarding/page_three.dart';
import 'package:trip_budgeter/pages/Onboarding/page_two.dart';
import 'package:trip_budgeter/pages/sign_in.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;
  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            children: const <Widget>[
              PageOne(),
              PageTwo(),
              PageThree(),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (currentIndex == 0) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => const Signin()),
                        );
                      } else {
                        setState(() {
                          currentIndex--;
                        });
                        controller.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Text(
                      currentIndex >= 1 ? "Previous" : "Skip Tour",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: controller,
                    onDotClicked: (index) {
                      controller.jumpToPage(index);
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    count: 3,
                    effect: const WormEffect(
                      offset: 16.0,
                      dotHeight: 16.0,
                      dotWidth: 16.0,
                      radius: 16,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (currentIndex >= 2) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) =>
                                  const Signin()), // Navigate to SignIn page
                        );
                      } else {
                        setState(() {
                          currentIndex++;
                        });
                        controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Text(
                      currentIndex >= 2 ? "Finish" : "Next",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
