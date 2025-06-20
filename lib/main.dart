import 'package:burgerapp/features/auth/view/login_page.dart';

import 'package:burgerapp/onboardingscreen/onboardingscreen.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {'/login_page': (context) => LoginPage()},
      home: Onboardingscreen(),
    );
  }
}
