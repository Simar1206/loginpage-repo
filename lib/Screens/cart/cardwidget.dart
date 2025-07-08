import 'package:burgerapp/Screens/AboutMenu/product_discription_card.dart';
import 'package:burgerapp/Screens/cart/cart_controller.dart';
import 'package:burgerapp/utils/constants/constant_colors/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  final currentquantity = 1.obs;

  void setindex(int index) {
    currentquantity.value = index;
  }
}

class Cardwidget extends StatelessWidget {
  //*obj of the counter controller class
  final CounterController controllercounter = Get.put(CounterController());
  //!define cart controller here
  final CartController cartController = Get.find();
  //*obj for the product description class
  final ProductDiscriptionCard ProductDiscriptionCardObj;
  Cardwidget({super.key, required this.ProductDiscriptionCardObj});

  @override
  Widget build(BuildContext context) {
    //!define remove from cart
    void _showsnackbar(bool? value) {
      if (value == false) {
        cartController.RemovefromCart(
          ProductDiscriptionCardObj,
        ); // Remove from cart
      }
      const snackbar = SnackBar(content: Text("removed from the cart"));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }

    return  Card(
        margin: EdgeInsets.all(12),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //*checkbox
            Checkbox(value: false, onChanged: _showsnackbar),
            //*image
            Image.asset(ProductDiscriptionCardObj.imageurl),
            Column(
              children: [
                //*card title
                Text(
                  ProductDiscriptionCardObj.card_title,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),

                const SizedBox(height: 4),

                //*cardprice
                Text(
                  ProductDiscriptionCardObj.price.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: ConstantColors.primarycolor,
                  ),
                ),

                const SizedBox(height: 8),

                //*inc/dec/remove
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //*dec
                          IncDecButtons(icons: Icon(Icons.remove)),
                          //*quantity
                          Obx(
                            () => Text(
                              controllercounter.currentquantity.value
                                  .toString(),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          //*inc
                          IncDecButtons(icons: Icon(Icons.add)),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        cartController.RemovefromCart(
                          ProductDiscriptionCardObj,
                        );
                      },
                      child: Image.asset('assests/trashicon.png'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
  }

  Container IncDecButtons({required Icon icons}) {
    return Container(
      padding: EdgeInsets.all(8),
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color(0xffEDEDED),
      ),
      child: icons,
    );
  }
}
