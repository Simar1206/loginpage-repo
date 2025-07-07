import 'package:burgerapp/features/auth/widgets/bottomnavbar.dart';
import 'package:burgerapp/utils/constants/constant_colors/constant_colors.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //back
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: ConstantColors.greycolor),
                        ),
                        child: Icon(Icons.arrow_back_ios, size: 20),
                      ),
                      //my cart
                      const Text(
                        'My Cart',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      //three dots
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: ConstantColors.greycolor),
                        ),
                        child: Icon(Icons.more_horiz_outlined, size: 20),
                      ),
                    ],
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

                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextButton.icon(
                      style: ButtonStyle(
                        minimumSize: WidgetStateProperty.all(
                          Size(double.infinity, 52),
                        ),
                        textStyle: WidgetStateProperty.all(
                          TextStyle(
                            fontSize: 14,
                            color: ConstantColors.headlinecolor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        foregroundColor: WidgetStateProperty.all(
                          ConstantColors.headlinecolor,
                        ),
                        backgroundColor: WidgetStateProperty.all(
                          ConstantColors.primarycolor,
                        ),
                        alignment: Alignment.center,
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(100),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/home_page');
                      },
                      
                      label: Text("Find Foods"),
                    ),
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
