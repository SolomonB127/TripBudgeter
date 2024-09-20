import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trip_budgeter/pages/Onboarding/page_one.dart';
import 'package:trip_budgeter/pages/Onboarding/page_three.dart';
import 'package:trip_budgeter/pages/Onboarding/page_two.dart';

import 'home_page.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: 0);
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            children: const <Widget>[
              // on-boarding pages
              PageOne(),
              PageTwo(),
              PageThree()
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
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomePage()));
                    },
                    child: Text(
                      currentIndex >= 1 ? "Previous" : "Skip Tour",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                  ),
                  SmoothPageIndicator(
                      controller: controller,
                      onDotClicked: (index) => {
                            controller.jumpToPage(index),
                            setState(() {
                              currentIndex = index;
                            })
                          },
                      count: 3,
                      effect: const WormEffect(
                        offset: 16.0,
                        dotHeight: 16.0,
                        dotWidth: 16.0,
                        radius: 16,
                      )),
                  GestureDetector(
                    onTap: () {
                      if (currentIndex >= 2) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const HomePage()));
                      } else {
                        setState(() {
                          currentIndex++;
                        });
                      }
                      controller.jumpToPage(currentIndex);
                    },
                    child: Text(
                      currentIndex >= 2 ? "Finish" : "Next",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.inversePrimary),
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

  // // Go to NextPage Method
  // void Function()? goToNext(){
  //   controller
  // }
}
