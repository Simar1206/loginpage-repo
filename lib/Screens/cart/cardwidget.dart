import 'package:burgerapp/Screens/AboutMenu/product_discription_card.dart';
import 'package:burgerapp/Screens/cart/cart_controller.dart';
import 'package:burgerapp/utils/constants/constant_colors/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CounterController extends GetxController {
  var currentquantity = 1.obs;

  void setindex(int index) {
    currentquantity.value = index;
  }
}

class Cardwidget extends StatefulWidget {
  final ProductDiscriptionCard ProductDiscriptionCardObj;
  const Cardwidget({super.key, required this.ProductDiscriptionCardObj});

  @override
  State<Cardwidget> createState() => _CardwidgetState();
}

class _CardwidgetState extends State<Cardwidget> {
  //*obj of the counter controller class
  final CartController controllercounter = Get.find();
  //*countercontroller for card:
  void IncrementCounter() {
    controllercounter.IncrementProductQuantity(
      //! cange from local current-- to global changes
      widget.ProductDiscriptionCardObj,
    );
  }

  void DecrementCounter() {
    //! These methods will now directly interact with the CartController
    cartController.DecrementProductQuantity(widget.ProductDiscriptionCardObj);
  }

  //!define cart controller here
  final CartController cartController = Get.find();

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
          widget.ProductDiscriptionCardObj,
        ); // Remove from cart
      }
      // const snackbar = SnackBar(content: Text("removed from the cart"));
      // ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }

    return Card(
      //margin: EdgeInsets.all(12),
      //elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 0),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
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
              widget.ProductDiscriptionCardObj.imageurl,
              height: heightImage,
              width: widthImage,
            ),

            //*SizedBox
            const SizedBox(width: 16),
            //! new eddited added exapnded
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //*card title
                  Text(
                    widget.ProductDiscriptionCardObj.card_title,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),

                  const SizedBox(height: 4),

                  //*cardprice
                  Text(
                    '\$ ${doubleformatter.format(widget.ProductDiscriptionCardObj.price).toString()}',
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
                          GestureDetector(
                            onTap: DecrementCounter,
                            child: IncDecButtons(
                              icons: Icon(
                                Icons.remove,
                                size: 16,
                                color: Color(0xff878787),
                              ),
                            ),
                          ),

                          //*SIzedbox
                          const SizedBox(width: 12),

                          //!quantity (NOW READ FROM CARTCONTROLLER)
                          Obx(
                            () => Text(
                              (cartController.cartItems[widget
                                          .ProductDiscriptionCardObj] ??
                                      0)
                                  .toString(),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),

                          //*SIzedbox
                          const SizedBox(width: 12),

                          //*inc
                          GestureDetector(
                            onTap: () => IncrementCounter(),
                            child: IncDecButtons(
                              icons: Icon(Icons.add, size: 16),
                            ),
                          ),
                        ],
                      ),

                      //*SizedBox
                      //rconst SizedBox(width: 44),
                      GestureDetector(
                        onTap: () {
                          cartController.RemovefromCart(
                            widget.ProductDiscriptionCardObj,
                          );
                        },
                        child: Image.asset('assests/trashicon.png'),
                      ),
                      const SizedBox(width: 2),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///********************************************************************************************************************************************** */

  Container IncDecButtons({required Icon icons}) {
    return Container(
      //padding: EdgeInsets.all(8),
      // margin: EdgeInsets.all(8),
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: Colors.black12),
      ),
      child: Center(child: icons),
    );
  }
}
