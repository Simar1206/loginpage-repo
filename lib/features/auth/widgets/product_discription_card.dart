import 'package:burgerapp/features/auth/widgets/product_discription_widget.dart';
import 'package:burgerapp/utils/constants/constant_colors/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductDiscriptionCard extends StatelessWidget {
  final String imageurl;
  final String card_title;
  final double rating;
  final int distance;
  final double price;

  //*others

  final icon_product;
  final String delivery_charge;
  final String time_taken;
  final String description;

  //* number formatter var
  final doubleformatter = NumberFormat('#,##0');

  //*height and width for container
  double heightcontainer = 207;
  double widthcontainer = 160;

  ProductDiscriptionCard({
    required this.imageurl,
    required this.card_title,
    required this.rating,
    required this.distance,
    required this.price,

    required this.delivery_charge,
    required this.time_taken,
    required this.description,
    required this.icon_product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //!imp
      onTap: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ProductDiscriptionWidget(productDiscriptionCardObj: this),
          ),
        );
      },
      child: Container(
        height: heightcontainer,
        width: widthcontainer,
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: ConstantColors.headlinecolor,
        ),
        child: Column(
          children: [
            //* Stack Images
            Stack(
              // alignment: Alignment.topRight,
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: Image.asset(
                    imageurl,
                    height: 106,
                    fit: BoxFit.contain,
                  ),
                ),

                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: EdgeInsets.all(8),
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assests/productcard/Like.png'),
                        // fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            //*SizedBox
            SizedBox(height: 8),

            //*Card Title
            Text(
              card_title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            //*SizedBox
            SizedBox(height: 4),
            //*Card rating and distance
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 16,
                      color: ConstantColors.primarycolor,
                    ),
                    SizedBox(height: 4),
                    Text(
                      rating.toString(),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 14,
                      color: ConstantColors.primarycolor,
                    ),
                    SizedBox(height: 4),
                    Text(
                      '${distance.toString()}m',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            //*SizedBox
            SizedBox(height: 6),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '\$ ${doubleformatter.format(price).toString()}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ConstantColors.primarycolor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
