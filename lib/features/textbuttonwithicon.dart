import 'package:burgerapp/utils/constants/constant_colors/constant_colors.dart';
import 'package:flutter/material.dart';

class Textbuttonwithicon extends StatelessWidget {
  final String buttontitle;
  final Icon buttonicon;
  final VoidCallback buttonOnPress;
  const Textbuttonwithicon({
    required this.buttonOnPress,
    required this.buttontitle,
    required this.buttonicon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(Size(double.infinity, 50)),
        textStyle: WidgetStateProperty.all(
          TextStyle(
            fontSize: 14,
            color: ConstantColors.headlinecolor,
            fontWeight: FontWeight.w600,
          ),
        ),
        foregroundColor: WidgetStateProperty.all(ConstantColors.headlinecolor),
        backgroundColor: WidgetStateProperty.all(ConstantColors.primarycolor),
        alignment: Alignment.center,
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(100),
          ),
        ),
      ),
      onPressed: () {
        buttonOnPress();
      },
      icon: buttonicon,
      label: Text(buttontitle),
    );
  }
}
