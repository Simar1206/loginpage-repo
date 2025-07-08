import 'package:burgerapp/utils/constants/constant_colors/constant_colors.dart';
import 'package:flutter/material.dart';

class Textbutton extends StatelessWidget {
  final String buttontitle;

  const Textbutton({required this.buttontitle, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/login_page');
        },
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          backgroundColor: ConstantColors.primarycolor,
        ),

        child: Center(
          child: Text(
            buttontitle,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: ConstantColors.headlinecolor,
            ),
          ),
        ),
      ),
    );
  }
}
