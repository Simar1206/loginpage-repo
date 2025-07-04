import 'package:burgerapp/Screens/Chat%20Page/chat_page.dart';
import 'package:burgerapp/Screens/Personal%20Details/personal_details.dart';
import 'package:burgerapp/Screens/cart/cart_page.dart';
import 'package:burgerapp/Screens/home/Category%20Section/drinks_page.dart';
import 'package:burgerapp/Screens/home/Category%20Section/pizza_page.dart';
import 'package:burgerapp/Screens/home/Category%20Section/taco_page.dart';
import 'package:burgerapp/Screens/home/homepage.dart';
import 'package:burgerapp/Screens/forgotpassword/forgotpass_page.dart';
import 'package:burgerapp/Screens/loginScreen/login_page.dart';
import 'package:burgerapp/Screens/RegisterScreen/register_page.dart';
import 'package:burgerapp/onboardingscreen/onboardingscreen.dart';
import 'package:burgerapp/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.interTextTheme()),
      debugShowCheckedModeBanner: false,
      routes: {
        '/login_page': (context) => LoginPage(),
        '/register_page': (context) => RegisterPage(),
        '/forgot_pass_page': (context) => ForgotpassPage(),
        '/on_boarding_screen': (context) => Onboardingscreen(),
        '/splash_screen': (context) => SplashScreen(),
        '/home_page': (context) => Homepage(),
        '/cart_page': (context) => CartPage(),
        '/chat_page': (context) => ChatPage(),
        '/personal_details_page': (context) => PersonalDetails(),
        '/taco_page': (context) => TacoPage(),
        '/drink_page': (context) => DrinksPage(),
        '/pizza_page': (context) => PizzaPage(),
        '/cart_page_': (context) => CartPage(),
      },
      home: Homepage(),
    );
  }
}
