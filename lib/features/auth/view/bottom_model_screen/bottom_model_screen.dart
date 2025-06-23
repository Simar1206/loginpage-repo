import 'package:burgerapp/utils/constants/constant_colors/constant_colors.dart';
import 'package:flutter/material.dart';

class BottomModelScreen extends StatelessWidget {
  const BottomModelScreen({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      margin: EdgeInsets.symmetric(vertical: 56),
      width: double.infinity,
      height: 512,
      child: Column(
        children: [
          //*Image
          Image.asset("assests/Illustrationsuccess.png"),

          //*SizedBox
          SizedBox(height: 32),

          //*title
          Text(
            "Password Changed",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),

          //*SizedBox
          SizedBox(height: 12),

          //*Subheading
          Text(
            "Password changed successfully, you can login \nagain with a new password",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xff878787),
            ),
          ),

          //*SizedBox
          SizedBox(height: 32),

          SizedBox(
            height: 52,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                backgroundColor: ConstantColors.primarycolor,
              ),

              child: Center(
                child: Text(
                  "Verify Account",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: ConstantColors.headlinecolor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
