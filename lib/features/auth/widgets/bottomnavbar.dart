import 'package:burgerapp/utils/constants/constant_colors/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bottomnavbarclass extends GetxController {
  var current = 0.obs;

  void setindex(int index) {
    current.value = index;
  }
}

class Bottomnavbar extends StatelessWidget {
  const Bottomnavbar({super.key});
  @override
  Widget build(BuildContext context) {
    final Bottomnavbarclass bottomnavbar = Get.put(Bottomnavbarclass());

    return Obx(
      () => BottomNavigationBar(
        elevation: 2,
        currentIndex: bottomnavbar.current.value,
        selectedItemColor: ConstantColors.primarycolor,
        unselectedItemColor: Color(0xff878787),
        onTap: (index) {
          bottomnavbar.setindex(index);
          switch (index) {
            case 0:
              Get.to('/home_page');
              break;
            case 1:
              Get.to('/cart_page');
              break;
            case 2:
              Get.to('/chat_page');
              break;
            case 3:
              Get.to('/personal_details_page');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_rounded),
            label: "Chat",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
