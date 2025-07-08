import 'package:burgerapp/Screens/cart/cardwidget.dart';
import 'package:burgerapp/features/auth/widgets/bottomnavbar.dart';
import 'package:burgerapp/features/textbuttonwidget.dart';
import 'package:burgerapp/features/topbarwidget.dart';
import 'package:burgerapp/utils/constants/constant_colors/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:burgerapp/Screens/cart/cart_controller.dart';

class LocationController extends GetxController {
  final currentlocation = 'mulund'.obs;

  final List<String> location = [
    'mulund',
    'thane',
    'bhandup',
    'kanjur',
    'vidyavihar',
    'ghatkopar',
    'vikhroli',
    'kurla',
  ];

  void setlocation(String index) {
    currentlocation.value = index;
  }
}

class CartPage extends StatefulWidget {
  //*obj for locationcontroller class
  LocationController controllerlocation = Get.put(LocationController());
  //*list of location

  CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageNotEmptyState();
}

class _CartPageNotEmptyState extends State<CartPage> {
  static const String hinttext = 'Promo Code. . .';
  final double heightTxtfiels = 52.0;
  //!define cartController here
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Bottomnavbar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          margin: const EdgeInsets.only(top: 41),
          child: Column(
            children: [
              //* top Widget
              Topbarwidget(
                firsticon: Icon(Icons.arrow_back_ios, size: 20),
                lasticon: Icon(Icons.more_horiz_outlined, size: 20),
                title: 'My Cart',
              ),

              //*SizedBox
              const SizedBox(height: 19),

              //*Set Location
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //* deliver Location + home
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Delivery Location',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: ConstantColors.greycolor,
                        ),
                      ),

                      Obx(
                        () => Text(
                          widget.controllerlocation.currentlocation.value,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //*change location button
                  ChangeLocationButton(widget: widget),
                ],
              ),
              //* sizedbox
              SizedBox(height: 24),

              //*PromoCode
              SizedBox(
                width: double.infinity,
                height: heightTxtfiels,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(color: Color(0xffEDEDED)),
                    ),

                    //*hint text
                    hintText: 'Promo Code. . .',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xffC2C2C2),
                    ),
                    //*prefix Icon
                    prefixIcon: Image.asset(
                      'assests/discounticon.png',
                      width: 25,
                      height: 25,
                    ),
                    //*Suffix Icon
                    suffixIcon: ApplytextButton(),
                  ),
                ),
              ),
              //*SizedBox
              SizedBox(height: 24),

              //*cards
              //! observable var
              GetX<CartController>(
                builder: (controller) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller
                        .cartItems
                        .length, // Access controller directly
                    itemBuilder: (context, index) {
                      final product = controller.cartItems[index];
                      return Cardwidget(ProductDiscriptionCardObj: product);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// *********************************************************************************************************************************
class ApplytextButton extends StatelessWidget {
  const ApplytextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
      child: SizedBox(
        height: 36,
        width: 86,
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            backgroundColor: ConstantColors.primarycolor,
          ),

          child: Center(
            child: Text(
              'Apply ',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: ConstantColors.headlinecolor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ChangeLocationButton extends StatelessWidget {
  const ChangeLocationButton({super.key, required this.widget});

  final CartPage widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: ConstantColors.primarycolor),
      ),
      child: DropdownButton<String>(
        icon: SizedBox.shrink(),
        //remove the underline
        underline: const SizedBox.shrink(),

        hint: const Text(
          'Change Location',
          style: TextStyle(fontSize: 10, color: ConstantColors.primarycolor),
        ),
        //value: widget.controllerlocation.currentlocation.value,
        items: widget.controllerlocation.location
            .map((loc) => DropdownMenuItem(value: loc, child: Text(loc)))
            .toList(),
        onChanged: (newloc) {
          if (newloc != null) {
            widget.controllerlocation.setlocation(newloc);
          }
        },
      ),
    );
  }
}
