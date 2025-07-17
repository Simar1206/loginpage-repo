import 'package:burgerapp/features/textbuttonwidget.dart';
import 'package:burgerapp/utils/constants/constant_colors/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class BoardingScreenPasswordChange extends StatefulWidget {
  const BoardingScreenPasswordChange({super.key});

  @override
  State<BoardingScreenPasswordChange> createState() =>
      _BoardingScreenPasswordChangeState();
}

class _BoardingScreenPasswordChangeState
    extends State<BoardingScreenPasswordChange> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Text(
          textAlign: TextAlign.center,
          'Did not recieve the email? Check your spam filter or try another email address',
          style: TextStyle(color: ConstantColors.greycolor, fontSize: 17),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Lotttie Animation:
            Center(
              child: Lottie.network(
                'https://lottie.host/f4e34460-97c3-4f35-9167-5f6441560fa4/FSmwHwFpAR.json',
              ),
            ),

            //body
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //heading
                Text(
                  'Check your mail',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 5),
                Text(
                  textAlign: TextAlign.center,
                  'Please check your email. We have sent you an email that contains a link to reset your password ',
                  style: TextStyle(
                    fontSize: 20,
                    color: ConstantColors.greycolor,
                  ),
                ),
                const SizedBox(height: 35),
                TextbuttonWidget(
                  buttontitle: 'Back to Login',
                  buttonOnpress: () {
                    Get.toNamed('/login_page');
                  },
                ),
              ],
            ),
            //button
            //footer
          ],
        ),
      ),
    );
  }
}
