import 'package:flutter/material.dart';

class TacoPage extends StatelessWidget {
  const TacoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        title: Text("Taco page"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
    );
  }
}