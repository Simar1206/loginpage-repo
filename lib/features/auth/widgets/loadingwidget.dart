import 'package:burgerapp/utils/constants/constant_colors/constant_colors.dart';
import 'package:flutter/material.dart';

class Loadingwidget extends StatefulWidget {
  const Loadingwidget({super.key});

  @override
  State<Loadingwidget> createState() => _LoadingwidgetState();
}

class _LoadingwidgetState extends State<Loadingwidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  var targetvalue = 0.75;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Use const with Duration
    );
    _animation =
        Tween<double>(begin: 0.0, end: targetvalue).animate(_controller)
          ..addListener(() {
            setState(() {});
          });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircularProgressIndicator(
              constraints: BoxConstraints(minWidth: 150, minHeight: 150),
              value: _animation.value,
              color: ConstantColors.headlinecolor,
              backgroundColor: Colors.white.withAlpha(9),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ConstantColors.headlinecolor,
            ),
            child: Icon(
              Icons.arrow_right_alt_rounded,
              color: ConstantColors.primarycolor,
              size: 45,
            ),
          ),
        ],
      ),
    );
  }
}
