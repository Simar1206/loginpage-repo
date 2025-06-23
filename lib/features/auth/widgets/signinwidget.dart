import 'package:flutter/material.dart';

class Signinwidget extends StatelessWidget {
  final String url;
  const Signinwidget({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: Color(0xffD6D6D6)),
      ),
      child: Image.asset(url),
    );
  }
}
