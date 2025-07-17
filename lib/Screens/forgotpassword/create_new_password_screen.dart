import 'package:burgerapp/Screens/forgotpassword/bottom_model_screen.dart';
import 'package:burgerapp/features/textbuttonwidget.dart';
import 'package:burgerapp/firebase/repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() => _ForgotpassPageState();
}

class _ForgotpassPageState extends State<CreateNewPasswordScreen> {
  final TextEditingController _newpassword = TextEditingController();
  final TextEditingController _matchnewpassword = TextEditingController();
  final Repository repo = Repository();

  @override
  void dispose() {
    // TODO: implement dispose
    _newpassword.dispose();
    _matchnewpassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: TextbuttonWidget(
        buttontitle: 'Reset Password',
        buttonOnpress: () async {
          if (_newpassword.text.isEmpty || _matchnewpassword.text.isEmpty) {
            Get.snackbar('Error', 'Please fill in both password fields.');
            return;
          }

          if (_newpassword.text != _matchnewpassword.text) {
            Get.snackbar('Invalid Password', 'Ensure both Passwords Match.');
            return;
          }
          Get.dialog(
            Center(child: CircularProgressIndicator()),
            barrierDismissible: false,
          );
          
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.only(top: 76),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //title + description
              Text(
                "Create New Password",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Text(
                "Your new password must be different from the previous used passwords",

                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff878787),
                ),
              ),

              //sized box for spacing
              const SizedBox(height: 32),

              // email address title + txtfield
              Text(
                "Password",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
              //*Sizedbox
              const SizedBox(height: 8),

              TextField(
                controller: _newpassword,
                decoration: InputDecoration(
                  constraints: BoxConstraints(maxHeight: 52),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Re- Enter Password",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
              //*Sizedbox
              const SizedBox(height: 8),
              TextField(
                controller: _matchnewpassword,
                decoration: InputDecoration(
                  constraints: BoxConstraints(maxHeight: 52),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              //sizedbox
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
