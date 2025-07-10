import 'package:burgerapp/features/auth/widgets/bottomnavbar.dart';
import 'package:burgerapp/features/topbarwidget.dart';
import 'package:burgerapp/utils/constants/constant_colors/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalDetails extends StatelessWidget {
  final String fieldtitle;
  PersonalDetails({required this.fieldtitle, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 44),
        child: Column(
          children: [
            //********************************************top widget***************************************************************************************************
            Topbarwidget(
              firsticon: Icon(Icons.arrow_back_ios),
              lasticon: Icon(Icons.settings_outlined),
              title: 'Personal Date',
              onPress: () {
                Get.toNamed('/settings_page');
              },
            ),

            const SizedBox(height: 16),

            //******************************************** PROFILE PIC ***************************************************************************************************
            ProfilePic(),

            const SizedBox(height: 24),

            //******************************************** PROFILE PIC ***************************************************************************************************
          ],
        ),
      ),
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(5),
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assests/profilepic.png'),
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            padding: EdgeInsets.all(6),
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Color(0xffF5F5FF),
            ),
            child: Center(
              child: Icon(
                Icons.camera_alt,
                color: ConstantColors.primarycolor,
                size: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
