import 'package:burgerapp/features/auth/widgets/bottomnavbar.dart';
import 'package:burgerapp/features/textbuttonwidget.dart';
import 'package:burgerapp/features/topbarwidget.dart';
import 'package:burgerapp/utils/constants/constant_colors/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPageEmpty extends StatelessWidget {
  const CartPageEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    final Bottomnavbarclass bottomnavbar = Get.find<Bottomnavbarclass>();
    return Scaffold(
      bottomNavigationBar: Bottomnavbar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 44),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Topbarwidget(
                    onPress: () {
                      bottomnavbar.setindex(0);
                      Get.toNamed('/home_page');
                    },
                    firsticon: Icon(Icons.arrow_back_ios, size: 20),
                    lasticon: Icon(Icons.more_horiz_outlined, size: 20),
                    title: 'My Cart',
                  ),
                  const SizedBox(height: 74),

                  Image.asset(
                    'assests/favoritepage.png',
                    width: 278,
                    height: 207,
                  ),

                  const SizedBox(height: 56),

                  Text(
                    "Ouch! Hungry",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Seems like you have not ordered\nany food yet",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: ConstantColors.greycolor,
                    ),
                  ),
                  SizedBox(height: 40),
                  TextbuttonWidget(
                    buttontitle: 'Find Foods',
                    buttonOnpress: () {
                      Navigator.pushNamed(context, '/home_page');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
