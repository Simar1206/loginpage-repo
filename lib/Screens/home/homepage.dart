import 'package:burgerapp/Screens/home/homeheader.dart';
import 'package:burgerapp/features/auth/widgets/bottomnavbar.dart';
import 'package:burgerapp/features/auth/widgets/dropdown.dart';
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //*HEADER
            Homeheader(),

            //*BOTTOM NAVIGATION BAR
            Align(alignment: Alignment.bottomCenter, child: Bottomnavbar()),
          ],
        ),
      ),
    );
  }
}
