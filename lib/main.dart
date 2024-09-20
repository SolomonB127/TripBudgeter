import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_budgeter/components/splash_screen.dart'; // Import SplashScreen
import 'package:trip_budgeter/services/auth/auth_service.dart';
// Import Onboarding page
import 'package:trip_budgeter/theme/theme.dart'; // Import Theme file
// Import the generated file for Firebase
import 'package:provider/provider.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  ChangeNotifierProvider(
    create: (context) => AuthService(), child: const MainApp()
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Set the design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightmode, // Use the light theme
          home: const SplashScreen(), // Display SplashScreen as the initial screen
        );
      },
    );
  }
}
