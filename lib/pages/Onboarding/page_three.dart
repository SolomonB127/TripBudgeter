import 'package:flutter/material.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Theme.of(context).colorScheme.surface,
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: screenHeight * 0.1,
              ),
              Image.asset("./assets/onBoardingImages/Group 300.png"),
              const SizedBox(height: 20.0),
              const Text("Enjoy Your Trip",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10.0),
              const Text(
                  "Embrace the joy of travel! Explore new horizons, savor every moment, and create lasting memories. Your journey begins here. Enjoy the trip!",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 11.0)),
            ],
          ),
        ),
      ),
    );
  }
}
