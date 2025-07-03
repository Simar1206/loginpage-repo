import 'package:flutter/material.dart';
import 'package:burgerapp/features/auth/widgets/product_discription_card.dart';

class Productgrid extends StatelessWidget {
  const Productgrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 22,
      ),
      children: [],
    );
  }
}
