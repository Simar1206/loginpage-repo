import 'package:flutter/material.dart';

class ProductDiscriptionCard extends StatelessWidget {
  final String imageurl;
  final String card_title;
  final double rating;
  final double distance;
  final double price;
  ProductDiscriptionCard({
    required this.imageurl,
    required this.card_title,
    required this.rating,
    required this.distance,
    required this.price,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          //* Stack Images
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                width: 137,
                height: 106,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(imageurl)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  width: 137,
                  height: 106,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assests/productcard/Like.png'),
                    ),
                  ),
                ),
              ),
            ],
          ),
          //*Card Title
          Text(
            card_title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          //*Card rating and distance
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [Icon(Icons.star), Text(rating.toString())]),
              Row(
                children: [
                  Icon(Icons.location_on_outlined),
                  Text(rating.toString()),
                ],
              ),
            ],
          ),
          Text('\$ ${distance.toString()}'),
        ],
      ),
    );
  }
}
