import 'package:flutter/material.dart';

class AboutMenuPage extends StatelessWidget {
  const AboutMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("About Menu Page"),
      ),
    );
  }
}