import 'package:burgerapp/features/auth/widgets/signinwidget.dart';
import 'package:burgerapp/utils/constants/constant_colors/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obsecuretxt = true;

  final TextEditingController _emailcontroller = TextEditingController();

  final TextEditingController _passcontroller = TextEditingController();

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
                  "Login to your\naccount.",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Please sign in to your account ",

                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff878787),
                  ),
                ),
              ),

              //sized box for spacing
              SizedBox(height: 35),

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
              SizedBox(height: 16),

              //password title + txtfield
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Password",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                ),
              ),
              //*Sizedbox
              SizedBox(height: 8),

              TextField(
                controller: _passcontroller,
                obscureText: _obsecuretxt,
                obscuringCharacter: '*',
                // maxLength: 327,
                decoration: InputDecoration(
                  labelText: "Password",
                  //icon suffix
                  suffixIcon: IconButton(
                    onPressed: _togglevisibility,
                    icon: Icon(
                      _obsecuretxt ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                  constraints: BoxConstraints(maxHeight: 52),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              //sized box:
              // SizedBox(height: 25),

              //forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/forgot_pass_page');
                    },
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: ConstantColors.primarycolor,
                      ),
                    ),
                  ),
                ],
              ),
              //sized box:
              // SizedBox(height: 25),
              //signup button
              SizedBox(
                height: 52,
                child: TextButton(
                  onPressed: () {
                    if (_emailcontroller.text.isEmpty ||
                        _passcontroller.text.isEmpty) {
                      Fluttertoast.showToast(
                        msg: "Fill all the fields",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.redAccent[100],
                        textColor: Colors.red,
                        fontSize: 20,
                      );
                      return;
                    }
                    Navigator.pushNamed(context, '/register_page');
                  },
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    backgroundColor: ConstantColors.primarycolor,
                  ),

                  child: Center(
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: ConstantColors.headlinecolor,
                      ),
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
                        fontSize: 15,
                        color: Color(0xff878787),
                      ),
                    ),
                  ),
                  Expanded(child: Divider(color: Color(0xff878787))),
                ],
              ),

              //sizedbox
              SizedBox(height: 35),
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
              SizedBox(height: 35),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/register_page');
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: ConstantColors.primarycolor,
                      ),
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

  void _togglevisibility() {
    setState(() {
      _obsecuretxt = !_obsecuretxt;
    });
  }
}
