import 'package:burgerapp/features/auth/widgets/signinwidget.dart';
import 'package:burgerapp/features/textbuttonwidget.dart';
import 'package:burgerapp/utils/constants/constant_colors/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passcontroller = TextEditingController();
  final TextEditingController _usernamecontroller = TextEditingController();

  bool _obsecuretxt = true;
  bool val = true;

  void togglevisibility() {
    setState(() {
      _obsecuretxt = !_obsecuretxt;
    });
  }

  void onchangecheckbox(bool? newval) {
    if (newval == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "you have to accept the terms",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          duration: Duration(seconds: 3),
          backgroundColor: ConstantColors.primarycolor,
        ),
      );
    }
    setState(() {
      val = newval ?? true;
    });
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
              //*title + description
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Create your new \naccount",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                ),
              ),

              //*Sized box for spacing.
              SizedBox(height: 8),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Create an account to start looking for the food\nyou like",

                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff878787),
                  ),
                ),
              ),

              //*sized box for spacing
              SizedBox(height: 12),

              //* email address title + txtfield
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Email Address",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                ),
              ),
              //* SIZED BOX
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

              //*sizedbox
              SizedBox(height: 14),

              //* Username title + txtfield
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Username",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                ),
              ),
              //* SIZED BOX
              SizedBox(height: 8),
              TextField(
                controller: _usernamecontroller,
                decoration: InputDecoration(
                  labelText: "Username",
                  constraints: BoxConstraints(maxHeight: 52),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              //*sizedbox
              SizedBox(height: 14),

              //password title + txtfield
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Password",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                ),
              ),
              //* SIZED BOX
              SizedBox(height: 8),

              TextField(
                controller: _passcontroller,
                obscureText: _obsecuretxt,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  labelText: "Password",
                  //*icon suffix
                  suffixIcon: IconButton(
                    onPressed: togglevisibility,
                    icon: Icon(
                      _obsecuretxt
                          ? Icons.visibility_off_outlined
                          : Icons.visibility,
                    ),
                  ),
                  constraints: BoxConstraints(maxHeight: 52),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              //*sized box:
              SizedBox(height: 14),

              //* checkbox
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Checkbox(
                      value: val,
                      onChanged: onchangecheckbox,
                      activeColor: ConstantColors.primarycolor,
                    ),
                  ),
                  SizedBox(width: 8),

                  Expanded(
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          " I Agree with ",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "Terms of Service ",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: ConstantColors.primarycolor,
                          ),
                        ),

                        Text(
                          "and ",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        Text(
                          "Privacy Policy",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: ConstantColors.primarycolor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              //*sized box
              SizedBox(height: 24),
              //*signup button
              TextbuttonWidget(
                buttontitle: 'Register',
                buttonOnpress: () {
                  if (_emailcontroller.text.isEmpty ||
                      _passcontroller.text.isEmpty ||
                      _usernamecontroller.text.isEmpty ||
                      val == false) {
                    Fluttertoast.showToast(
                      msg: "Please fill in all the fields",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.redAccent[100],
                      textColor: Colors.red,
                      fontSize: 20,
                    );
                    return;
                  }
                  Get.toNamed('/home_page');
                },
              ),

              //sizedbox
              SizedBox(height: 34),
              //divider
              Row(
                children: <Widget>[
                  Expanded(child: Divider(color: Color(0xff878787))),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Or Sign in With",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Color(0xff878787),
                      ),
                    ),
                  ),
                  Expanded(child: Divider(color: Color(0xff878787))),
                ],
              ),

              //sizedbox
              SizedBox(height: 34),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Signinwidget(url: "assests/google.png"),
                  SizedBox(width: 20),
                  Signinwidget(url: "assests/facebook.png"),
                  SizedBox(width: 20),
                  Signinwidget(url: "assests/apple.png"),
                ],
              ),
              //sizedbox
              SizedBox(height: 32),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Already have an Account? ",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/login_page');
                    },
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: ConstantColors.primarycolor,
                      ),
                    ),
                  ),
                ],
              ),

              //*sized box
              SizedBox(height: 34),
            ],
          ),
        ),
      ),
    );
  }
}
