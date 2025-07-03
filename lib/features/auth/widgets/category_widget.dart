import 'package:burgerapp/utils/constants/constant_colors/constant_colors.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String imageurl;
  final String discription;
  final bool isselected;

  const CategoryWidget({
    required this.imageurl,
    required this.discription,
    required this.isselected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isselected
            ? ConstantColors.primarycolor
            : ConstantColors.headlinecolor,
      ),
      height: 30,
      width: 90,
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              // color: Colors.amber,
              image: DecorationImage(image: AssetImage(imageurl)),
            ),
          ),
          SizedBox(height: 4),
          Text(
            discription,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: isselected
                  ? ConstantColors.headlinecolor
                  : ConstantColors.greycolor,
              fontFamily: 'OpenSans',
            ),
          ),
        ],
      ),
    );
  }
}
