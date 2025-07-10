import 'package:burgerapp/utils/constants/constant_colors/constant_colors.dart';
import 'package:flutter/material.dart';

class TextbuttonWidget extends StatelessWidget {
  final String buttontitle;
  final VoidCallback buttonOnpress;

  const TextbuttonWidget({
    required this.buttontitle,
    required this.buttonOnpress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: TextButton(
        onPressed: () {
          buttonOnpress();
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
