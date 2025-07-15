//import 'package:burgerapp/features/auth/widgets/headlinewidget.dart';
import 'package:burgerapp/features/auth/widgets/loadingwidget.dart';
import 'package:burgerapp/onboardingscreen/Screens/page_component.dart';
import 'package:burgerapp/utils/constants/constant_colors/constant_colors.dart';
import 'package:burgerapp/utils/constants/constant_text/constant_texts.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboardingscreen extends StatefulWidget {
  const Onboardingscreen({super.key});

  @override
  State<Onboardingscreen> createState() => _OnboardingscreenState();
}

class _OnboardingscreenState extends State<Onboardingscreen> {
  //defining the late page controller:
  // late final CarouselSliderController _controller = CarouselSliderController();
  late final PageController _controller = PageController();
  int currentIndex = 0;
  bool _islast = false;
  List<String> imageData = [
    "assests/burger1.png",
    "assests/burger2.png",
    "assests/burger3.png",
  ];
  List<Widget> component = [
    PageComponent(
      header: ConstantTexts.headline,
      subHeader: ConstantTexts.subheadline,
    ),
    PageComponent(
      header: ConstantTexts.headline,
      subHeader: ConstantTexts.subheadline,
    ),
    PageComponent(
      header: ConstantTexts.headline,
      subHeader: ConstantTexts.subheadline,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageData[currentIndex]),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 500,
          margin: const EdgeInsets.all(20.0),
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(48),
            //color: ConstantColors.primarycolor,
            color: ConstantColors.primarycolor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            //heading
            children: [
              SizedBox(
                width: 250,
                height: 250,
                child: PageView(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                      _islast = (index == 2);
                    });
                  },
                  children: component,
                ),
              ),
              SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: SlideEffect(
                  dotWidth: 30,
                  dotHeight: 8,
                  activeDotColor: Colors.white,
                ),
              ),
              SizedBox(height: _islast ? 20.0 : 100.0),
              _islast
                  ? GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/login_page');
                      },
                      child: Center(child: Loadingwidget()),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //skip
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/login_page');
                          },
                          child: Text(
                            "Skip",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: ConstantColors.headlinecolor,
                            ),
                          ),
                        ),

                        //next
                        GestureDetector(
                          onTap: () {
                            if (currentIndex < component.length) {
                              _controller.nextPage(
                                duration: Duration(seconds: 1),
                                curve: Curves.easeIn,
                              );
                              currentIndex++;
                              setState(() {});
                            }
                          },
                          child: Row(
                            children: [
                              Text(
                                "Next",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: ConstantColors.headlinecolor,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Icon(
                                Icons.arrow_right_alt,
                                color: ConstantColors.headlinecolor,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
              SizedBox(height: _islast ? 30.0 : 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
