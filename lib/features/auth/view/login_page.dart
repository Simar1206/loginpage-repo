import 'package:burgerapp/features/auth/widgets/signinwidget.dart';
import 'package:burgerapp/utils/constants/constant_colors/constant_colors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
              Text(
                "Login to your account.",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
              ),
              Text(
                "Please sign in to your account ",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff878787),
                ),
              ),

              //sized box for spacing
              SizedBox(height: 35),

              // email address title + txtfield
              TextField(
                decoration: InputDecoration(
                  constraints: BoxConstraints(maxHeight: 52, maxWidth: 327),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: "Email Address",
                ),
              ),

              //sizedbox
              SizedBox(height: 16),

              //password title + txtfield
              TextField(
                obscureText: true,
                obscuringCharacter: '*',
                // maxLength: 327,
                decoration: InputDecoration(
                  constraints: BoxConstraints(maxHeight: 52, maxWidth: 327),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: "Password",
                ),
              ),

              //sized box:
              SizedBox(height: 25),

              //forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot password",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: ConstantColors.primarycolor,
                    ),
                  ),
                ],
              ),
              //sized box:
              SizedBox(height: 25),
              //signup button
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: ConstantColors.primarycolor,
                ),

                height: 55,
                width: double.infinity,
                child: Center(
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: ConstantColors.headlinecolor,
                    ),
                  ),
                ),
              ),

              //sizedbox
              SizedBox(height: 25),
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
                        fontSize: 14,
                        color: Color(0xff878787),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Color(0xff878787),
                    ),
                  ),
                ],
              ),

              //sizedbox
              SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Signinwidget(url: "assests/googleicon.png"),
                  Signinwidget(url: "assests/facebookicon.png"),
                  Signinwidget(url: "assests/appleicon.png"),
                ],
              ),
              //sizedbox
              SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),

                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: ConstantColors.primarycolor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
