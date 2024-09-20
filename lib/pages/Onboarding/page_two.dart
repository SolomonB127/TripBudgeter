import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

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
              Image.asset("./assets/onBoardingImages/Group 301.png"),
              const SizedBox(
                height: 20.0,
              ),
              const Text("Select Your Resting Place",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                  "Indulge in tranquility and comfort. Choose your perfect resting place with us, where serenity meets luxury. Select a haven that resonates with your soul. Your ultimate relaxation awaits.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11.0))
            ],
          ),
        ),
      ),
    );
  }
}
