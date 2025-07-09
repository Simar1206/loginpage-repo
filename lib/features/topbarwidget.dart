import 'package:burgerapp/utils/constants/constant_colors/constant_colors.dart';
import 'package:flutter/material.dart';

class Topbarwidget extends StatelessWidget {
  final Icon firsticon;
  final Icon lasticon;
  final String title;

  const Topbarwidget({
    required this.firsticon,
    required this.lasticon,
    required this.title,

    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //back
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/home_page');
            },
            child: Container(
              //padding: const EdgeInsets.all(8),
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: ConstantColors.greycolor),
              ),
              child: Center(child: firsticon),
            ),
          ),
          //my cart
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          //three dots
          Container(
            //padding: const EdgeInsets.all(8),
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: ConstantColors.greycolor),
            ),
            child: Center(child: lasticon),
          ),
        ],
      ),
    );
  }
}
