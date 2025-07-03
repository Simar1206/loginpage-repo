import 'package:burgerapp/features/auth/widgets/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryTileController extends GetxController {
  var currenttile = 0.obs;

  void setindex(int index) {
    currenttile.value = index;
  }
}

class CategoryTile extends StatelessWidget {
  // obj
  final CategoryTileController tilecontroller = Get.put(
    CategoryTileController(),
  );
  CategoryTile({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> listtile = [
      {'imageurl': 'assests/tiles/burgertile.png', 'discription': 'Burger'},
      {'imageurl': 'assests/tiles/tacotile.png', 'discription': 'Taco'},
      {'imageurl': 'assests/tiles/drinktile.png', 'discription': 'Drinks'},
      {'imageurl': 'assests/tiles/pizzatile.png', 'discription': 'Pizza'},
    ];

    return ListView.builder(
      itemCount: listtile.length,

      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final item = listtile[index];

        return Obx(() {
          final isSelected = tilecontroller.currenttile.value == index;

          return GestureDetector(
            onTap: () {
              tilecontroller.setindex(index);
              switch (index) {
                case 0:
                  Get.toNamed('/home_page');
                  break;
                case 1:
                  Get.toNamed('/taco_page');
                  break;
                case 2:
                  Get.toNamed('/drink_page');
                  break;
                case 3:
                  Get.toNamed('/pizza_page');
                  break;
              }
            },
            child: Padding(
              padding: EdgeInsetsGeometry.only(
                right: index == (listtile.length - 1) ? 0 : 20,
              ),
              child: CategoryWidget(
                imageurl: item['imageurl']!,
                discription: item['discription']!,
                isselected: isSelected,
              ),
            ),
          );
        });
      },
    );
  }
}
