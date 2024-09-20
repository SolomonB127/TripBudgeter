import 'package:flutter/material.dart';
import 'package:trip_budgeter/pages/Onboarding.dart';

class OnGenerateRoute{
  static Route<dynamic> generateRoute(RouteSettings settings){
switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => const Onboarding());
    default:
      return MaterialPageRoute(builder: (context) => const Text("Unknown"));
}
  }
}