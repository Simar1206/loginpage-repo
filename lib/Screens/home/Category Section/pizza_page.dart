import 'package:flutter/material.dart';

class PizzaPage extends StatelessWidget {
  const PizzaPage({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text("Pizza page"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
    );
  }
}