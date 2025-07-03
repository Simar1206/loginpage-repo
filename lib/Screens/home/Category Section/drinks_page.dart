import 'package:flutter/material.dart';

class DrinksPage extends StatelessWidget {
  const DrinksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drinks page"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
    );
  }
}
