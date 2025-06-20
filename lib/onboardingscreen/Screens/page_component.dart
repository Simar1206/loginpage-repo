import 'package:burgerapp/utils/constants/constant_colors/constant_colors.dart';
import 'package:flutter/material.dart';

class PageComponent extends StatelessWidget {
  const PageComponent({super.key,required this.header,required this.subHeader});
  final String header;
  final String subHeader;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          header,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600,
            color: ConstantColors.headlinecolor,
          ),
        ),

        //subheading
        SizedBox(height: 20),
        Text(
          subHeader,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, color: ConstantColors.headlinecolor),
        ),
      ],
    );
  }
}
