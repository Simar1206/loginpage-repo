import 'package:burgerapp/Screens/AboutMenu/product_discription_card.dart';
import 'package:flutter/material.dart';

class Productgrid extends StatelessWidget {
  const Productgrid({super.key});

  @override
  Widget build(BuildContext context) {
    final double AspectRatio = 160 / 250;

    final List<Map<String, dynamic>> productdata = [
      {
        'imageurl': 'assests/productcard/burger1.png',
        'card_title': 'Ordinary Burgers',
        'rating': 4.9,
        'distance': 190,
        'price': 17230.0,
        'icon_product': 'assests/tiles/burgertile.png',

        //*others
        'delivery_charge': 'Free Delivery',
        'time_taken': '20-30',
        'description':
            'Burger With Meat is a typical food from our restaurant that is much in demand by many people, this is very recommended for you.',
      },

      {
        'imageurl': 'assests/productcard/burger2.png',
        'card_title': 'Burger With Meat',
        'rating': 5.0,
        'distance': 200,
        'price': 1800.0,
        //*others
        'icon_product': 'assests/tiles/burgertile.png',
        'delivery_charge': 'Free Delivery',
        'time_taken': '20-30',
        'description':
            'Burger With Meat is a typical food from our restaurant that is much in demand by many people, this is very recommended for you.',
      },

      {
        'imageurl': 'assests/productcard/burger3.png',
        'card_title': 'Bombay Blast',
        'rating': 3.9,
        'distance': 150,
        'price': 1900.23,
        //*others
        'icon_product': 'assests/tiles/burgertile.png',
        'delivery_charge': 'Free Delivery',
        'time_taken': '20-30',
        'description':
            'Burger With Meat is a typical food from our restaurant that is much in demand by many people, this is very recommended for you.',
      },

      {
        'imageurl': 'assests/productcard/burger4.png',
        'card_title': 'Smoky Chipotle',
        'rating': 5.0,
        'distance': 120,
        'price': 1500.0,
        //*others
        'icon_product': 'assests/tiles/burgertile.png',
        'delivery_charge': 'Free Delivery',
        'time_taken': '20-30',
        'description':
            'Burger With Meat is a typical food from our restaurant that is much in demand by many people, this is very recommended for you.',
      },

      {
        'imageurl': 'assests/productcard/burger2.png',
        'card_title': 'Spiced Paneer',
        'rating': 3.5,
        'distance': 135,
        'price': 17563.98,
        //*others
        'icon_product': 'assests/tiles/burgertile.png',
        'delivery_charge': 'Free Delivery',
        'time_taken': '20-30',
        'description':
            'Burger With Meat is a typical food from our restaurant that is much in demand by many people, this is very recommended for you.',
      },

      {
        'imageurl': 'assests/productcard/burger1.png',
        'card_title': 'Sunrise Supreme',
        'rating': 4.0,
        'distance': 20,
        'price': 1800.52,
        //*others
        'icon_product': 'assests/tiles/burgertile.png',
        'delivery_charge': 'Free Delivery',
        'time_taken': '20-30',
        'description':
            'Burger With Meat is a typical food from our restaurant that is much in demand by many people, this is very recommended for you.',
      },
    ];
    return GridView.builder(
      shrinkWrap: true,

      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 22,
        mainAxisSpacing: 16,
        childAspectRatio: AspectRatio,
      ),
      itemCount: productdata.length,
      itemBuilder: (context, index) {
        final productIndex = productdata[index];
        return ProductDiscriptionCard(
          imageurl: productIndex['imageurl'],
          card_title: productIndex['card_title'],
          rating: productIndex['rating'],
          distance: productIndex['distance'],
          price: productIndex['price'],
          icon_product: productIndex['icon_product'],
          delivery_charge: productIndex['delivery_charge'],
          time_taken: productIndex['time_taken'],
          description: productIndex['description'],
        );
        // return null;
      },
    );
  }
}
