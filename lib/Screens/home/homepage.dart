import 'package:burgerapp/Screens/home/Category%20Section/category_tile.dart';
import 'package:burgerapp/Screens/home/homeheader.dart';
import 'package:burgerapp/Screens/home/productgrid.dart';
import 'package:burgerapp/features/auth/widgets/bottomnavbar.dart';
import 'package:burgerapp/features/auth/widgets/dropdown.dart';
import 'package:burgerapp/utils/constants/constant_colors/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final Dropdownlocations ddl = Get.put(Dropdownlocations());
  final double sizecontainer = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      //*BOTTOM NAV BAR
      bottomNavigationBar: Bottomnavbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //*HEADER
            Homeheader(),

            //*Sized Box
            SizedBox(height: 44),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  //*Category Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Find by Category",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "See All",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: ConstantColors.primarycolor,
                        ),
                      ),
                    ],
                  ),

                  //*TabBar

                  //*Sizedbox
                  SizedBox(height: 16),

                  //* Find by category Tile Section
                  SizedBox(height: 100, child: CategoryTile()),

                  //*SizedBox
                  SizedBox(height: 16),

                  //* GridView With Cards.
                  Productgrid(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
