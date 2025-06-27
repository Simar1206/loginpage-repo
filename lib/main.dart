import 'package:burgerapp/features/auth/view/forgotpass_page.dart';
import 'package:burgerapp/features/auth/view/login_page.dart';
import 'package:burgerapp/features/auth/view/register_page.dart';
import 'package:burgerapp/onboardingscreen/onboardingscreen.dart';
import 'package:burgerapp/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.interTextTheme()),
      debugShowCheckedModeBanner: false,
      routes: {
        '/login_page': (context) => LoginPage(),
        '/register_page': (context) => RegisterPage(),
        '/forgot_pass_page': (context) => ForgotpassPage(),
        '/on_boarding_screen': (context) => Onboardingscreen(),
      },
      home: SplashScreen(),
    );
  }
}
