import 'package:burgerapp/Screens/forgotpassword/bottom_model_screen.dart';
import 'package:burgerapp/features/textbuttonwidget.dart';
import 'package:burgerapp/firebase/repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotpassPage extends StatefulWidget {
  const ForgotpassPage({super.key});

  @override
  State<ForgotpassPage> createState() => _ForgotpassPageState();
}

class _ForgotpassPageState extends State<ForgotpassPage> {
  final TextEditingController _emailcontroller = TextEditingController();
  final Repository repo = Repository();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailcontroller.dispose();
    super.dispose();
  }

  //!
  void _bottommodelscr() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => BottomModelScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(24.0),
        child: TextbuttonWidget(
          buttontitle: 'Continue',
          buttonOnpress: () async {
            if (_emailcontroller.text.isEmpty) {
              Get.snackbar(
                'Error',
                'You are required to fill in the email address',
              );
              return;
            } else {
              Get.dialog(
                Center(child: CircularProgressIndicator()),
                barrierDismissible: false,
              );
              final result = await repo.ForgotPassword(
                email: _emailcontroller.text,
              );
              Get.back();

              if (result.firebase_result) {
                Get.snackbar(
                  'Success',
                  result.message ?? 'Password reset email sent',
                );
                _bottommodelscr();
              } else {
                Get.snackbar(
                  'Error',
                  result.message ?? 'Unable to send reset link',
                );
              }
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //title + description
              const Text(
                "Forgot password?",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              const Text(
                "Enter your email address and we'll send you confirmation code to reset your password",

                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff878787),
                ),
              ),

              //sized box for spacing
              SizedBox(height: 32),

              // email address title + txtfield
              const Text(
                "Email Address",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
              //*Sizedbox
              const SizedBox(height: 8),

              TextField(
                controller: _emailcontroller,
                decoration: InputDecoration(
                  constraints: BoxConstraints(maxHeight: 52),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              //sizedbox
              const SizedBox(height: 80),

              //signup button

              //sizedbox
              const SizedBox(height: 25),

              //divider
            ],
          ),
        ),
      ),
    );
  }
}
