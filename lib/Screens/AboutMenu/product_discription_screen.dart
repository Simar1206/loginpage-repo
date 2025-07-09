import 'package:burgerapp/Screens/cart/cart_controller.dart';
import 'package:burgerapp/features/textbuttonwithicon.dart';
import 'package:burgerapp/utils/constants/constant_colors/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:burgerapp/Screens/AboutMenu/product_discription_card.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

//*new class for state management
class CounterForProduct extends GetxController {
  var current_counter_val = 1.obs;

  void SetCounter(int val) {
    current_counter_val.value = val;
  }
}

class ProductDiscriptionWidget extends StatelessWidget {
  //*Obj for the above class
  CounterForProduct countercontroller = Get.put(CounterForProduct());
  //! get obj of cart controller
  final CartController cartController = Get.find<CartController>();

  //*inc function
  void _inc() {
    countercontroller.current_counter_val++;
  }

  //*dec function
  void _dec() {
    if (countercontroller.current_counter_val > 1) {
      countercontroller.current_counter_val--;
    }
  }

  //* number formatter var
  final doubleformatter = NumberFormat('#,##0');

  final ProductDiscriptionCard productDiscriptionCardObj;
  ProductDiscriptionWidget({
    super.key,
    required this.productDiscriptionCardObj,
  });

  @override
  Widget build(BuildContext context) {
    //* mediaqueury
    final double screensize = MediaQuery.of(context).size.height;
    final fiftyfivepercentsize = screensize * 0.55;
    final fourtysevenpercentsize = screensize * 0.47;
    return SafeArea(
      child: Scaffold(
        //! pass the product to the cart
        bottomSheet: AddtoCartButton(
          productDiscriptionObj: productDiscriptionCardObj,
        ),
        body: Stack(
          children: [
            //*background Image
            Image.asset(
              height: fiftyfivepercentsize,
              width: double.maxFinite,
              productDiscriptionCardObj.imageurl,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
            //* top Controls
            //! to create new custom icons and add onPressed(){}
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/home_page');
                      },
                      child: Image.asset('assests/Back.png'),
                    ),
                    Text(
                      'About this Menu',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: ConstantColors.headlinecolor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/favorite_search_page');
                      },
                      child: FavoriteIcon(),
                    ),
                    //!Image.asset('assests/likeIconwhite.png'),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: fourtysevenpercentsize,
                margin: const EdgeInsets.symmetric(vertical: 16),
                padding: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: ConstantColors.headlinecolor,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ListView(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //*body
                      //*Title
                      Row(
                        children: [
                          Text(
                            productDiscriptionCardObj.card_title,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Image.asset(
                            productDiscriptionCardObj.icon_product,
                            height: 25,
                            width: 25,
                          ),
                        ],
                      ),

                      //*Sizedbox
                      const SizedBox(height: 8),

                      //*price
                      Text(
                        '\$ ${doubleformatter.format(productDiscriptionCardObj.price).toString()}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: ConstantColors.primarycolor,
                        ),
                      ),

                      //*SizedBox
                      const SizedBox(height: 16),

                      //* row for free delivery, time, rating
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xffffefd6),
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //*Delivery
                            RichText(
                              text: TextSpan(
                                text: '\$ ',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: ConstantColors.primarycolor,
                                ),

                                children: <TextSpan>[
                                  TextSpan(
                                    text: productDiscriptionCardObj
                                        .delivery_charge,
                                    style: TextStyle(
                                      color: ConstantColors.greycolor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //*Time
                            Row(
                              children: [
                                Icon(
                                  Icons.access_time_filled,
                                  //size: 14,
                                  color: ConstantColors.primarycolor,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  productDiscriptionCardObj.time_taken,
                                  style: TextStyle(
                                    color: ConstantColors.greycolor,
                                  ),
                                ),
                              ],
                            ),

                            //*Rating
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  //size: 14,
                                  color: ConstantColors.primarycolor,
                                ),
                                //*spacing
                                const SizedBox(width: 8),
                                Text(
                                  (productDiscriptionCardObj.rating.toString()),
                                  style: TextStyle(
                                    color: ConstantColors.greycolor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      //*SizedBox
                      const SizedBox(height: 34),

                      //*discription
                      const Text(
                        "Description",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      //*Sizedbox
                      const SizedBox(height: 8),

                      //*description body
                      Text(
                        productDiscriptionCardObj.description,
                        style: TextStyle(
                          color: ConstantColors.greycolor,
                          fontSize: 14,
                        ),
                      ),

                      //*SizedBox
                      const SizedBox(height: 34),
                      //*row for inc and final price
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              //*dec
                              IconButton(
                                onPressed: _dec,
                                icon: Icon(Icons.remove),
                              ),
                              //* number shown
                              Obx(
                                () => Text(
                                  countercontroller.current_counter_val
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),

                              //*inc
                              IconButton(
                                onPressed: _inc,
                                icon: Icon(Icons.add),
                              ),
                            ],
                          ),

                          //*final price
                          Obx(() {
                            final quantity =
                                countercontroller.current_counter_val.value;
                            final price =
                                productDiscriptionCardObj.price * quantity;

                            return Text(
                              '\$ ${doubleformatter.format(price)}',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: ConstantColors.primarycolor,
                              ),
                            );
                          }),
                        ],
                      ),

                      // //* Sizedbox
                      const SizedBox(height: 60),

                      // //*add to cart
                      // AddtoCartButton(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        //color: ConstantColors.headlinecolor,
        borderRadius: BorderRadius.circular(100),
        border: BoxBorder.all(color: Color(0xffEDEDED), width: 1),
      ),
      child: Icon(
        Icons.favorite_border_outlined,
        size: 20,
        color: Color(0xffEDEDED),
      ),
    );
  }
}

class AddtoCartButton extends StatelessWidget {
  //! recieve obj of product discription
  final ProductDiscriptionCard productDiscriptionObj;
  const AddtoCartButton({super.key, required this.productDiscriptionObj});

  @override
  Widget build(BuildContext context) {
    //!defined a cartcontroller and using Get.find() we find the controller.
    final CartController cartController = Get.find();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Textbuttonwithicon(
        buttonOnPress: () {
          //!when button pushed obj added to cart
          cartController.AddtoCart(productDiscriptionObj);
          Navigator.pushNamed(context, '/cart_page');
        },
        buttontitle: 'Add to cart',
        buttonicon: Icon(Icons.shopping_cart_outlined),
      ),
    );
  }
}
