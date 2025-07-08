import 'package:burgerapp/Screens/forgotpassword/bottom_model_screen.dart';
import 'package:burgerapp/features/textbuttonwidget.dart';
import 'package:burgerapp/utils/constants/constant_colors/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotpassPage extends StatefulWidget {
  const ForgotpassPage({super.key});

  @override
  State<ForgotpassPage> createState() => _ForgotpassPageState();
}

class _ForgotpassPageState extends State<ForgotpassPage> {
  final TextEditingController _emailcontroller = TextEditingController();

  void _bottommodelscr() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => BottomModelScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.only(top: 76),

          child: Column(
            children: [
              //title + description
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Forgot password?",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter your email address and we'll send you confirmation code to reset your password",

                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff878787),
                  ),
                ),
              ),

              //sized box for spacing
              SizedBox(height: 32),

              // email address title + txtfield
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Email Address",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                ),
              ),
              //*Sizedbox
              SizedBox(height: 8),

              TextField(
                controller: _emailcontroller,
                decoration: InputDecoration(
                  labelText: "Email Address",
                  constraints: BoxConstraints(maxHeight: 52),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              //sizedbox
              SizedBox(height: 80),

              //signup button
              TextbuttonWidget(
                buttontitle: 'Continue',
                buttonOnpress: () {
                  if (_emailcontroller.text.isEmpty) {
                    Fluttertoast.showToast(
                      msg: "Enter Email Address.",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.redAccent[100],
                      textColor: Colors.red,
                      fontSize: 20,
                    );
                    return;
                  }
                  _bottommodelscr();
                },
              ),

              //sizedbox
              SizedBox(height: 25),

              //divider
            ],
          ),
        ),
      ),
    );
  }
}
