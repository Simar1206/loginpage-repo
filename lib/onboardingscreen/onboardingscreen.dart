//import 'package:burgerapp/features/auth/widgets/headlinewidget.dart';
import 'package:burgerapp/features/auth/widgets/loadingwidget.dart';
import 'package:burgerapp/onboardingscreen/Screens/boarding_screen_1.dart';
import 'package:burgerapp/onboardingscreen/Screens/boarding_screen_2.dart';
import 'package:burgerapp/onboardingscreen/Screens/boarding_screen_3.dart';
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
  late final PageController _controller = PageController();
  int currentIndex = 0;
  bool _islast = false;
  List<String> imageData = [
    "assests/burger1.png",
    "assests/burger2.png",
    "assests/burger3.png",
  ];
  List<PageComponent> component = [
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
          margin: const EdgeInsets.all(20.0),
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(48),
            //color: ConstantColors.primarycolor,
            color: ConstantColors.primarycolor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            //heading
            children: [
              PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                    _islast = (index == 2);
                  });
                },
                children: component,
              ),
              SizedBox(height: 30),
              SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: SlideEffect(
                  dotWidth: 30,
                  dotHeight: 8,
                  activeDotColor: Colors.white,
                ),
              ),
              SizedBox(height: 80),
              _islast
                  ? GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/login_page');
                      },
                      child: Row(children: [Loadingwidget()]),
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
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
                              fontSize: 15,
                              color: ConstantColors.headlinecolor,
                            ),
                          ),
                        ),

                        //next
                        GestureDetector(
                          onTap: () {
                            currentIndex = currentIndex++;
                            _controller.nextPage(
                              duration: Duration(seconds: 1),
                              curve: Curves.easeIn,
                            );
                            setState(() {});
                          },
                          child: Row(
                            children: [
                              Text(
                                "Next",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: ConstantColors.headlinecolor,
                                ),
                              ),
                              Icon(
                                Icons.forward_sharp,
                                color: ConstantColors.headlinecolor,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
              SizedBox(height: 30),
            ],
          ),
        ),
        // )Stack(
        //   children: [
        //     Center(
        //       child: PageView(
        //         controller: _controller,
        //         onPageChanged: (index) {
        //           setState(() {
        //             _islast = (index == 2);
        //           });
        //         },
        //         children: [
        //           BoardingScreen1(),
        //           BoardingScreen2(),
        //           BoardingScreen3(),
        //         ],
        //       ),
        //     ),
        //     //smooth page indicator
        //     Container(
        //       alignment: Alignment(0, 0.6),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.center,

        //         children: [
        //           SmoothPageIndicator(
        //             controller: _controller,
        //             count: 3,
        //             effect: SlideEffect(
        //               dotWidth: 30,
        //               dotHeight: 8,
        //               activeDotColor: Colors.white,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),

        //     //next skip
        //     Padding(
        //       padding: const EdgeInsets.all(50.0),
        //       child: Container(
        //         alignment: Alignment(1, 0.9),
        //         child: Row(
        //           crossAxisAlignment: CrossAxisAlignment.end,
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             //skip
        //             GestureDetector(
        //               onTap: () {
        //                 Navigator.pushNamed(context, '/login_page');
        //               },
        //               child: Text(
        //                 "Skip",
        //                 style: TextStyle(
        //                   fontSize: 15,
        //                   color: ConstantColors.headlinecolor,
        //                 ),
        //               ),
        //             ),

        //             //next
        //             _islast
        //                 ? GestureDetector(
        //                     onTap: () {
        //                       Navigator.pushNamed(context, '/login_page');
        //                     },
        //                     child: Row(children: [Loadingwidget(

        //                     )]),
        //                   )
        //                 : GestureDetector(
        //                     onTap: () {
        //                       _controller.nextPage(
        //                         duration: Duration(seconds: 1),
        //                         curve: Curves.easeIn,
        //                       );
        //                     },
        //                     child: Row(
        //                       children: [
        //                         Text(
        //                           "Next",
        //                           style: TextStyle(
        //                             fontSize: 15,
        //                             color: ConstantColors.headlinecolor,
        //                           ),
        //                         ),
        //                         Icon(
        //                           Icons.forward_sharp,
        //                           color: ConstantColors.headlinecolor,
        //                           size: 20,
        //                         ),
        //                       ],
        //                     ),
        //                   ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ],
      ),
    );
  }
}
