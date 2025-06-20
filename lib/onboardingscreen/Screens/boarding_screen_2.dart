import 'package:burgerapp/utils/constants/constant_colors/constant_colors.dart';
import 'package:burgerapp/utils/constants/constant_text/constant_texts.dart';
import 'package:flutter/material.dart';

class BoardingScreen2 extends StatelessWidget {
  const BoardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: Container(
              width: 350,
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(48),
                //color: ConstantColors.primarycolor,
                color: Colors.deepPurple,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
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
        ],
      ),
    );
  }
}
