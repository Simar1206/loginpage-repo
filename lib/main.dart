import 'package:burgerapp/Screens/Chat%20Page/chat_page.dart';
import 'package:burgerapp/Screens/Favorite%20Search%20Page/favorite_search_page.dart';
import 'package:burgerapp/Screens/Personal%20Details/personal_details.dart';
import 'package:burgerapp/Screens/cart/cart_controller.dart';
import 'package:burgerapp/Screens/cart/cart_page.dart';
import 'package:burgerapp/Screens/cart/cart_page_empty.dart';
import 'package:burgerapp/Screens/forgotpassword/boarding_screen_password_change.dart';
import 'package:burgerapp/Screens/forgotpassword/bottom_model_screen.dart';
import 'package:burgerapp/Screens/forgotpassword/create_new_password_screen.dart';
import 'package:burgerapp/Screens/home/Category%20Section/drinks_page.dart';
import 'package:burgerapp/Screens/home/Category%20Section/pizza_page.dart';
import 'package:burgerapp/Screens/home/Category%20Section/taco_page.dart';
import 'package:burgerapp/Screens/home/homepage.dart';
import 'package:burgerapp/Screens/forgotpassword/forgotpass_page.dart';
import 'package:burgerapp/Screens/loginScreen/login_page.dart';
import 'package:burgerapp/Screens/RegisterScreen/register_page.dart';
import 'package:burgerapp/firebase_options.dart';
import 'package:burgerapp/onboardingscreen/onboardingscreen.dart';
import 'package:burgerapp/settings/setting_page.dart';
import 'package:burgerapp/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(Discount());
  Get.put(CartController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.interTextTheme()),
      debugShowCheckedModeBanner: false,
      routes: {
        '/main_screen': (context) => MyApp(),
        '/login_page': (context) => LoginPage(),
        '/register_page': (context) => RegisterPage(),
        '/forgot_pass_page': (context) => ForgotpassPage(),
        '/on_boarding_screen': (context) => Onboardingscreen(),
        '/splash_screen': (context) => SplashScreen(),
        '/home_page': (context) => Homepage(),
        '/cart_page': (context) {
          if (cartController.cartItems.isEmpty) {
            return CartPageEmpty();
          } else {
            return CartPage();
          }
        },
        '/chat_page': (context) => ChatPage(),
        '/personal_details_page': (context) => PersonalDetails(),
        '/taco_page': (context) => TacoPage(),
        '/drink_page': (context) => DrinksPage(),
        '/pizza_page': (context) => PizzaPage(),
        '/favorite_search_page': (context) => FavoriteSearchPage(),
        '/settings_page': (context) => SettingPage(),
        // '/cart_page' : (context)=> CartPage(),
        '/boarding_screen_for_new_pass': (context) =>
            BoardingScreenPasswordChange(),
        'forgot_password_page': (context) => ForgotpassPage(),
        '/create_new_password_page': (context) => CreateNewPasswordScreen(),
        'bottom_model_password_screen': (context) => BottomModelScreen(),
      },

      // main.dart (or app_routes.dart)
      home: SplashScreen(),
    );
  }
}
