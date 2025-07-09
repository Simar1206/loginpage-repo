import 'package:burgerapp/Screens/AboutMenu/product_discription_card.dart';
import 'package:burgerapp/Screens/cart/cart_controller.dart';
import 'package:burgerapp/utils/constants/constant_colors/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
    //* number formatter
    final doubleformatter = NumberFormat('#,##0');
    //* size of image
    const double heightImage = 82;
    const double widthImage = 85;

    //!define remove from cart
    void showsnackbar(bool? value) {
      if (value == false) {
        cartController.RemovefromCart(
          ProductDiscriptionCardObj,
        ); // Remove from cart
      }
      // const snackbar = SnackBar(content: Text("removed from the cart"));
      // ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }

    return Card(
      //margin: EdgeInsets.all(12),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //*checkbox
            Checkbox(
              value: true,
              onChanged: showsnackbar,
              activeColor: ConstantColors.primarycolor,
              checkColor: ConstantColors.headlinecolor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(4),
              ),
              side: BorderSide(width: 0),
            ),
            //*image
            Image.asset(
              ProductDiscriptionCardObj.imageurl,
              height: heightImage,
              width: widthImage,
            ),

            //*SizedBox
            const SizedBox(width: 16),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //*card title
                Text(
                  ProductDiscriptionCardObj.card_title,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),

                const SizedBox(height: 4),

                //*cardprice
                Text(
                  '\$ ${doubleformatter.format(ProductDiscriptionCardObj.price).toString()}',
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
                    Row(
                      children: [
                        IncDecButtons(icons: Icon(Icons.remove, size: 12)),

                        //*SIzedbox
                        const SizedBox(width: 16),

                        //*quantity
                        Obx(
                          () => Text(
                            controllercounter.currentquantity.value.toString(),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        //*SIzedbox
                        const SizedBox(width: 16),

                        //*inc
                        IncDecButtons(icons: Icon(Icons.add, size: 12)),
                      ],
                    ),

                    //*SizedBox
                    const SizedBox(width: 54),
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
      ),
    );
  }

  ///********************************************************************************************************************************************** */

  Container IncDecButtons({required Icon icons}) {
    return Container(
      padding: EdgeInsets.all(8),
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: Color(0xffEDEDED)),
      ),
      child: icons,
    );
  }
}
