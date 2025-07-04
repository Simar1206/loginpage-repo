import 'package:burgerapp/features/auth/widgets/product_discription_card.dart';
import 'package:flutter/material.dart';


class Productgrid extends StatelessWidget {
  const Productgrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ProductDiscriptionCard(
          imageurl: 'assests/productcard/burger1.png',
          card_title: 'Ordinary Burgers',
          rating: 4.9,
          distance: 190,
          price: 17230,
          icon_product: 'assests/tiles/burgertile.png',
          //*others
         
          delivery_charge: 'Free Delivery',
          time_taken: '20-30',
          description: 'Burger With Meat is a typical food from our restaurant that is much in demand by many people, this is very recommended for you.',
        ),
        ProductDiscriptionCard(
          imageurl: 'assests/productcard/burger2.png',
          card_title: 'Burger With Meat',
          rating: 5.0,
          distance: 200,
          price: 1800,
          //*others
          icon_product: 'assests/tiles/burgertile.png',
          delivery_charge: 'Free Delivery',
          time_taken: '20-30',
          description: 'Burger With Meat is a typical food from our restaurant that is much in demand by many people, this is very recommended for you.',
        ),
        ProductDiscriptionCard(
          imageurl: 'assests/productcard/burger3.png',
          card_title: 'Bombay Blast',
          rating: 3.9,
          distance: 150,
          price: 1900,
          //*others
          icon_product: 'assests/tiles/burgertile.png',
          delivery_charge: 'Free Delivery',
          time_taken: '20-30',
          description: 'Burger With Meat is a typical food from our restaurant that is much in demand by many people, this is very recommended for you.',
        ),
        ProductDiscriptionCard(
          imageurl: 'assests/productcard/burger4.png',
          card_title: 'Smoky Chipotle',
          rating: 5.0,
          distance: 120,
          price: 1500,
          //*others
          icon_product: 'assests/tiles/burgertile.png',
          delivery_charge: 'Free Delivery',
          time_taken: '20-30',
          description: 'Burger With Meat is a typical food from our restaurant that is much in demand by many people, this is very recommended for you.',
        ),
        ProductDiscriptionCard(
          imageurl: 'assests/productcard/burger2.png',
          card_title: 'Spiced Paneer',
          rating: 3.5,
          distance: 135,
          price: 17563,
          //*others
          icon_product: 'assests/tiles/burgertile.png',
          delivery_charge: 'Free Delivery',
          time_taken: '20-30',
          description: 'Burger With Meat is a typical food from our restaurant that is much in demand by many people, this is very recommended for you.',
        ),
        ProductDiscriptionCard(
          imageurl: 'assests/productcard/burger1.png',
          card_title: 'Sunrise Supreme',
          rating: 4.0,
          distance: 20,
          price: 1800,
          //*others
          icon_product: 'assests/tiles/burgertile.png',
          delivery_charge: 'Free Delivery',
          time_taken: '20-30',
          description: 'Burger With Meat is a typical food from our restaurant that is much in demand by many people, this is very recommended for you.',
        ),
      ],
    );
  }
}
