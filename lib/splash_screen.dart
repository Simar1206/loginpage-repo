import 'package:burgerapp/onboardingscreen/onboardingscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    // This hides the system UI (status bar and navigation bar) for a more immersive experience.
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) =>
              Onboardingscreen(), // Replace with your home screen widget
        ),
      );
    });
  }

  @override
  void dispose() {
    //makes sure the system UI is reset to its default state when the splash screen is disposed ie status bar and navigation bar are visible again
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFFFFE0B2),
              const Color(0xFFFFB74D),
              const Color(0xFFFF9800),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 150, child: Image.asset('assests/burgerbyte.png')),
            const SizedBox(height: 10),
            const Text(
              'BurgerByte',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
