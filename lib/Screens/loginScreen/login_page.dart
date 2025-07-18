import 'package:burgerapp/features/auth/widgets/bottomnavbar.dart';
import 'package:burgerapp/features/auth/widgets/signinwidget.dart';
import 'package:burgerapp/features/textbuttonwidget.dart';
import 'package:burgerapp/firebase/repository.dart';
import 'package:burgerapp/utils/constants/constant_colors/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Bottomnavbarclass bottomnav = Bottomnavbarclass();

  bool _obsecuretxt = true;
  bool _isChecked = false;

  late final TextEditingController _emailController;
  late final TextEditingController _passController;
  late SharedPreferences prefs;

  final Repository repo =
      Repository(); // Can be here or initialized in initState if needed

  //load user Email and Password
  void handleRemeberMe(bool? value) {
    if (value == null) {
      return;
    }
    setState(() {
      _isChecked = value;
    });

    prefs.setBool('rememberMe', _isChecked);
    if (_isChecked) {
      prefs.setString('email', _emailController.text.trim());
      prefs.setString('password', _passController.text.trim());
    } else {
      prefs.remove('email');
      prefs.remove('password');
    }
  }

  void LoadUserEmailPass() async {
    try {
      var rememberMe = prefs.getBool('rememberMe') ?? false;
      var email = prefs.getString('email') ?? '';
      var password = prefs.getString('password') ?? '';

      if (rememberMe) {
        setState(() {
          _isChecked = true;
          _emailController.text = email; 
          _passController.text =
              password; 
        });
      } else {
        setState(() {
          _isChecked = false; 
        });

        _emailController.text = '';
        _passController.text = '';
      }
    } catch (e) {
      Get.snackbar('Preference Error', 'Expection Occured');
    }
  }

  @override
  void initState() {
    super.initState();

    // Initialize controllers here, only once when the widget is first created
    _emailController = TextEditingController();
    _passController = TextEditingController();
    SharedPreferences.getInstance().then((instance) {
      prefs = instance;
      LoadUserEmailPass();
    });
  }

  @override
  void dispose() {
    // Dispose controllers when the widget is removed from the widget tree
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.only(top: 76),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //title + description
              Text(
                "Login to your\naccount.",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              Text(
                "Please sign in to your account ",

                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff878787),
                ),
              ),

              //sized box for spacing
              SizedBox(height: 35), //35
              // email address title + txtfield
              Text(
                "Email Address",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ), //15
              ),
              //*Sizedbox
              SizedBox(height: 8), //8

              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  constraints: BoxConstraints(maxHeight: 52), //52
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              //sizedbox
              SizedBox(height: 16), //16
              //password title + txtfield
              Text(
                "Password",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ), //15
              ),
              //*Sizedbox
              SizedBox(height: 8), //8

              TextField(
                controller: _passController,
                obscureText: _obsecuretxt,
                obscuringCharacter: '*',
                // maxLength: 327,
                decoration: InputDecoration(
                  //icon suffix
                  suffixIcon: IconButton(
                    onPressed: _togglevisibility,
                    icon: Icon(
                      _obsecuretxt ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                  constraints: BoxConstraints(maxHeight: 52), //52
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              //sized box:
              // SizedBox(height: 25),

              //forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        activeColor: ConstantColors.primarycolor,
                        checkColor: ConstantColors.headlinecolor,
                        value: _isChecked,
                        onChanged: handleRemeberMe,
                      ),
                      const Text('Remember Me'),
                    ],
                  ),

                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/forgot_pass_page');
                    },
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14, //14
                        color: ConstantColors.primarycolor,
                      ),
                    ),
                  ),
                ],
              ),
              //sized box:
              // SizedBox(height: 25),
              //signup button
              TextbuttonWidget(
                buttontitle: 'Sign In',
                buttonOnpress: () async {
                  String email = _emailController.text.trim();
                  String pass = _passController.text.trim();

                  if (_emailController.text.isEmpty ||
                      _passController.text.isEmpty) {
                    Get.snackbar('Empty Fields', 'Kindly Fill All the fields');
                    return;
                  }
                  Get.dialog(
                    Center(child: CircularProgressIndicator()),
                    barrierDismissible: false,
                  );

                  final result = await repo.Login(email: email, password: pass);
                  Get.back();

                  if (result.firebase_result) {
                    if (_isChecked) {
                      prefs.setString('email', email);
                      prefs.setString('password', pass);
                    } else {
                      prefs.remove('email');
                      prefs.remove('password');
                    }
                    Navigator.pushNamed(context, '/home_page', );
                    
                  } else {
                    Get.snackbar('${result.message} ', '');
                  }
                },
              ),

              //sizedbox
              SizedBox(height: 25),
              //divider
              Row(
                children: <Widget>[
                  Expanded(child: Divider(color: Color(0xff878787))),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
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
