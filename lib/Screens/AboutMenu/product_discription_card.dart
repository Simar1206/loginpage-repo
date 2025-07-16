import 'package:burgerapp/Screens/AboutMenu/product_discription_screen.dart';
import 'package:burgerapp/features/auth/widgets/favoriteiconwidget.dart';
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
  double heightcontainer = double.infinity;
  double widthcontainer = double.infinity;

  //* snackbar
  final snackbarforfalse = SnackBar(content: Text("Add to Favorites"));
  final snackbarfortrue = SnackBar(content: Text('Removed from Favorites'));

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
        // height: heightcontainer,
        // width: widthcontainer,
        padding: EdgeInsets.all(8),
        //! removed margin for personal phone
        // margin: EdgeInsets.all(8),
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
                  height: 105,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(imageurl, fit: BoxFit.cover),
                  ),
                ),

                Align(
                  alignment: Alignment.topRight,
                  //! added padding xoxoxoxoxox
                  child: Favoriteiconwidget(),
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
                    SizedBox(width: 4),
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
            Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                '\$ ${doubleformatter.format(price)}',
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
