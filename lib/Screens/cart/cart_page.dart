import 'package:burgerapp/Screens/AboutMenu/product_discription_card.dart';
import 'package:burgerapp/Screens/cart/cardwidget.dart';
import 'package:burgerapp/features/auth/widgets/bottomnavbar.dart';
import 'package:burgerapp/features/textbuttonwidget.dart';
import 'package:burgerapp/features/topbarwidget.dart';
import 'package:burgerapp/utils/constants/constant_colors/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:burgerapp/Screens/cart/cart_controller.dart';
import 'package:intl/intl.dart';

//*-------------------- LOCATION CONTROLLER CLASS -------------------------------------------------------------------------------------------------------------------------------------------------
class LocationController extends GetxController {
  final currentlocation = 'Mulund'.obs;

  final List<String> location = [
    'Mulund',
    'Thane',
    'Bhandup',
    'Kanjur',
    'Vidyavihar',
    'Ghatkopar',
    'Vikhroli',
    'Kurla',
  ];

  void setlocation(String index) {
    currentlocation.value = index;
  }
}

//*-------------------- DISCOUNT CONTROLLER CLASS -------------------------------------------------------------------------------------------------------------------------------------------------

class Discount extends GetxController {
  NumberFormat doubleformatter = NumberFormat('#,##0');

  var promocode = ''.obs;
  var discountVar = 0.obs;

  void SetDiscount(String code, BuildContext context) {
    if (code.trim().toUpperCase() == 'SIMAR55555') {
      promocode.value = code;
      discountVar.value = 10900;
      Get.snackbar(
        'Promo code applied Successfully, ',
        'disount worth \$${doubleformatter.format(discountVar.value)} is added',
      );
    } else {
      Get.snackbar('Invalid Promo Code', 'please Enter a Valid Promo Code');
    }
  }
}

//*-------------------- CART PAGE CLASS  -------------------------------------------------------------------------------------------------------------------------------------------------

class CartPage extends StatefulWidget {
  LocationController controllerlocation = Get.put(LocationController());
  CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageNotEmptyState();
}

class _CartPageNotEmptyState extends State<CartPage> {
  //*-------------------- LIST OF OBJECTS OF CLASSES -------------------------------------------------------------------------------------------------------------------------------------------------
  final Discount DiscountController = Get.find<Discount>();

  final promoController = TextEditingController();
  static const String hinttext = 'Promo Code. . .';
  final double heightTxtfiels = 52.0;
  //!define cartController here
  final CartController cartController = Get.put<CartController>(
    CartController(),
  );

  @override
  Widget build(BuildContext context) {
    final Bottomnavbarclass bottomnavbar = Get.find<Bottomnavbarclass>();
    return Scaffold(
      bottomSheet:
          //*Order now button
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: TextbuttonWidget(
              buttontitle: 'Order Now',
              buttonOnpress: () {
                Get.toNamed('/home_page');
              },
            ),
          ),
      bottomNavigationBar: Bottomnavbar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          margin: const EdgeInsets.only(top: 41),
          child: Column(
            children: [
              //* top Widget
              Topbarwidget(
                onPress: () {
                  bottomnavbar.setindex(0);
                  Get.toNamed('/home_page');
                },
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
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
                  //*onSubmit
                  onSubmitted: (value) {
                    DiscountController.SetDiscount(value, context);
                  },
                  //* promo controller
                  controller: promoController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(color: Color(0xffEDEDED)),
                    ),

                    //*hint text
                    hintText: hinttext,
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
                    suffixIcon: ApplytextButton(
                      promoCodeController: promoController,
                      buttonOnPress: () {
                        DiscountController.SetDiscount(
                          promoController
                              .text, // Use the text from the controller
                          context,
                        );
                      },
                    ),
                  ),
                ),
              ),

              //*SizedBox
              SizedBox(height: 24),

              //*cards
              //! observable var
              Obx(() {
                //! defined obj of thr Rx<map> and passing it as a list
                final List<ProductDiscriptionCard> productsInCart =
                    cartController.cartItems.keys.toList();
                return ListView.builder(
                  padding: EdgeInsets.only(top: 0),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  //!since now cartItems are now passed as a list
                  itemCount: productsInCart.length,
                  itemBuilder: (context, int index) {
                    final ProductDiscriptionCard product =
                        productsInCart[index]; //cartItems is a obs list of productDescriptionCard
                    return Cardwidget(ProductDiscriptionCardObj: product);
                  },
                );
              }),

              //*SizedBox
              const SizedBox(height: 40),

              //*Information Payment
              InformationPayment(),

              //*si
              SizedBox(height: 110),
            ],
          ),
        ),
      ),
    );
  }
}

/// *********************************************************************************************************************************

//*-------------------- TMAIN INFORMATION WINDOW   -------------------------------------------------------------------------------------------------------------------------------------------------

class InformationPayment extends StatelessWidget {
  final Discount discountController = Get.find<Discount>();
  final CartController cartController = Get.find<CartController>();

  var DeliveryFee = 0.0;

  InformationPayment({super.key});

  @override
  Widget build(BuildContext context) {
    NumberFormat doubleformatter = NumberFormat('#,##0');
    return Container(
      padding: EdgeInsets.all(12),
      width: double.maxFinite,

      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //*header
          const Text(
            'Payment Summary',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          //*SizedBoc
          const SizedBox(height: 8),

          //*Total Items;
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  //*displaying the number of items/tiles
                  PaymentFields(paymentTitle: 'Total Items '),
                  Obx(
                    () =>
                        Text('(${cartController.cartItems.length.toString()})'),
                  ),
                ],
              ),
              //*displaying the total cost
              Obx(
                () => Text(
                  '\$${doubleformatter.format(cartController.totalCost)}',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),

          //*sizedbox
          const SizedBox(height: 16),
          //*delivery fee
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PaymentFields(paymentTitle: 'Delivery Fee'),
              Text(
                DeliveryFee == 0.0 ? 'Free' : '$DeliveryFee',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          //*sizedbox
          const SizedBox(height: 16),
          //*Discount
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PaymentFields(paymentTitle: 'Discount'),
              Obx(() {
                return Text(
                  '-\$${doubleformatter.format(discountController.discountVar.value)}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: ConstantColors.primarycolor,
                  ),
                );
              }),
            ],
          ),
          //*sizedbox
          const SizedBox(height: 16),
          //*Total
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PaymentFields(paymentTitle: 'Total'),
              Obx(() {
                var finalcost =
                    cartController.totalCost -
                    discountController.discountVar.value +
                    DeliveryFee;
                if (cartController.totalCost == 0) {
                  finalcost = 0.0;
                }

                return Text(
                  '\$${doubleformatter.format(finalcost)}',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}

//*-------------------- CONSTANT STYLE FOR TEXT FIELD  -------------------------------------------------------------------------------------------------------------------------------------------------

class PaymentFields extends StatelessWidget {
  late String paymentTitle;

  PaymentFields({super.key, required this.paymentTitle});

  @override
  Widget build(BuildContext context) {
    return Text(
      paymentTitle,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Color(0xff878787),
      ),
    );
  }
}

//*-------------------- TEXT FIELD BUTTON   -------------------------------------------------------------------------------------------------------------------------------------------------

class ApplytextButton extends StatelessWidget {
  final Discount DiscountController = Get.find<Discount>();
  final TextEditingController promoCodeController;
  final VoidCallback buttonOnPress;
  ApplytextButton({
    required this.promoCodeController,
    required this.buttonOnPress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
      child: SizedBox(
        height: 36,
        width: 86,
        child: TextButton(
          onPressed: () {
            buttonOnPress();
          },
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

//*-------------------- CHANGE LOCATION BUTTON  -------------------------------------------------------------------------------------------------------------------------------------------------
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

        hint: Center(
          child: const Text(
            'Change Location',
            style: TextStyle(fontSize: 10, color: ConstantColors.primarycolor),
          ),
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
