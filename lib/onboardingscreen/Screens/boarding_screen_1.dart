import 'package:burgerapp/utils/constants/constant_colors/constant_colors.dart';
import 'package:burgerapp/utils/constants/constant_text/constant_texts.dart';
import 'package:flutter/material.dart';

class BoardingScreen1 extends StatelessWidget {
  const BoardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assests/burger1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          margin: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(48),
            //color: ConstantColors.primarycolor,
            color: ConstantColors.primarycolor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Stack(
              children: [
                Column(
                  //heading
                  children: [
                    Text(
                      ConstantTexts.headline,
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
                      ConstantTexts.subheadline,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: ConstantColors.headlinecolor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
