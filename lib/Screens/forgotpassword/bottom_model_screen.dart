import 'package:burgerapp/features/textbuttonwidget.dart';
import 'package:flutter/material.dart';

class BottomModelScreen extends StatelessWidget {
  const BottomModelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      margin: EdgeInsets.symmetric(vertical: 30),
      width: double.infinity,
      //height: 700,
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
            "Password changed successfully, you can login again with a new password",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xff878787),
            ),
          ),

          //*SizedBox
          SizedBox(height: 32),

          TextbuttonWidget(
            buttontitle: 'Verify Account',
            buttonOnpress: () {
              Navigator.pushNamed(context, 'login_page');
            },
          ),
        ],
      ),
    );
  }
}
