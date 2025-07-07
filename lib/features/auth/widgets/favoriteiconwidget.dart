import 'package:burgerapp/utils/constants/constant_colors/constant_colors.dart';
import 'package:flutter/material.dart';

class Favoriteiconwidget extends StatefulWidget {
  const Favoriteiconwidget({super.key});

  @override
  State<Favoriteiconwidget> createState() => _FavoriteiconwidgetState();
}

class _FavoriteiconwidgetState extends State<Favoriteiconwidget> {
  bool _isLiked = false; // Move this outside build()

  void toggleLiked() {
    setState(() {
      _isLiked = !_isLiked; // Fix: toggle properly
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: toggleLiked,
        onDoubleTap: () {
          Navigator.pushNamed(context, '/favorite_search_page');
        },
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ConstantColors.headlinecolor,
          ),
          height: 30,
          width: 30,
          child: Icon(
            _isLiked ? Icons.favorite : Icons.favorite_border_outlined,
            color: ConstantColors.favoriteiconcolor,
            size: 15,
          ),
        ),
      ),
    );
  }
}
