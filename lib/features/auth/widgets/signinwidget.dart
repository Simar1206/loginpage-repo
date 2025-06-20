import 'package:flutter/material.dart';

class Signinwidget extends StatelessWidget {
  final String url;
  const Signinwidget({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        image: DecorationImage(image: AssetImage(url)),
      ),
    );
  }
}
