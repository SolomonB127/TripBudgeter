import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      height: screenHeight,
      color: Theme.of(context).colorScheme.surface,
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: screenHeight * 0.1),
              Image.asset("./assets/onBoardingImages/Group 302.png"),
              const SizedBox(height: 20.0),
              const Text(
                "Welcome to TravelWise",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              const Text(
                "Take control of your travel expenses with our budget app! Effortlessly track spending, set limits, and maximize your trips without breaking the bank. Welcome to a smarter way to explore the world while staying on budget!",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
