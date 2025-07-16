import 'package:burgerapp/features/auth/widgets/bottomnavbar.dart';
import 'package:burgerapp/features/textbuttonwidget.dart';
import 'package:burgerapp/features/topbarwidget.dart';
import 'package:burgerapp/firebase/repository.dart';
import 'package:burgerapp/utils/constants/constant_colors/constant_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:phone_form_field/phone_form_field.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  final User? usr = FirebaseAuth.instance.currentUser;
  final Repository repo = Repository();
  final Bottomnavbarclass bottomnavbar = Get.find<Bottomnavbarclass>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Bottomnavbar(),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: TextbuttonWidget(
          buttontitle: 'Save',
          buttonOnpress: () {
            Get.toNamed('/home_page');
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 44),
          child: Column(
            children: [
              //********************************************top widget***************************************************************************************************

              //*custom top bar:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //*back
                  TopHeaderIcon(
                    icon: Icons.arrow_back_ios_new,
                    onPress: () {
                      bottomnavbar.setindex(0);
                      Get.toNamed('/home_page');
                    },
                  ),

                  //*titlr
                  const Text(
                    'Personal Details',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  //*settings
                  TopHeaderIcon(
                    icon: Icons.settings_outlined,
                    onPress: () {
                      Get.toNamed('/settings_page');
                    },
                  ),
                ],
              ),

              // Topbarwidget(
              //   firsticon: Icon(Icons.arrow_back_ios),
              //   lasticon: Icon(Icons.settings_outlined),
              //   title: 'Personal Date',
              //   onPress: () {
              //     bottomnavbar.setindex(0);
              //     Get.toNamed('/settings_page');
              //   },
              // ),
              const SizedBox(height: 16),

              //******************************************** PROFILE PIC ***************************************************************************************************
              ProfilePic(),

              const SizedBox(height: 24),

              //******************************************** FIELDS ***************************************************************************************************

              //*TITLE
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FieldTItle(fieldTitle: 'Full Name'),
                  const SizedBox(height: 8),
                  //*TXTFIELD
                  Container(
                    padding: const EdgeInsets.all(16),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: ConstantColors.greycolor),
                    ),
                    child: Text(usr?.displayName ?? ''),
                  ),
                  const SizedBox(height: 12),

                  //*TITLE
                  FieldTItle(fieldTitle: 'date of Birth'),
                  const SizedBox(height: 8),
                  //*TXTFIELD
                  DOBtextfieldWidget(),
                  const SizedBox(height: 12),

                  //*TITLE
                  FieldTItle(fieldTitle: 'Gender'),
                  const SizedBox(height: 8),
                  //*TXTFIELD
                  GenderWidget(),
                  const SizedBox(height: 12),

                  //*TITLE
                  FieldTItle(fieldTitle: 'Phone'),
                  const SizedBox(height: 8),
                  //*TXTFIELD
                  PhoneFormField(
                    initialValue: PhoneNumber.parse('+91'),

                    isCountrySelectionEnabled: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: ConstantColors.greycolor),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  //*TITLE
                  FieldTItle(fieldTitle: 'Email'),
                  const SizedBox(height: 8),
                  //*TXTFIELD
                  Container(
                    padding: const EdgeInsets.all(16),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: ConstantColors.greycolor),
                    ),
                    child: Text(usr?.email ?? ''),
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TopHeaderIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPress;
  const TopHeaderIcon({required this.icon, super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: ConstantColors.greycolor),
        ),
        width: 36,
        height: 36,
        child: Icon(icon, size: 20),
      ),
    );
  }
}

//******************************************** Gender FIELD CLASS ***************************************************************************************************
class GenderWidget extends StatefulWidget {
  const GenderWidget({super.key});

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  int? _selectedGenderval;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      value: _selectedGenderval,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: ConstantColors.greycolor),
        ),
      ),
      items: const [
        DropdownMenuItem(value: -1, child: Text('Male')),
        DropdownMenuItem(value: 2, child: Text('Female')),
        DropdownMenuItem(value: 3, child: Text('Others')),
        DropdownMenuItem(value: 4, child: Text('Prefer not to Say')),
      ],
      onChanged: (int? newVal) {
        setState(() {
          _selectedGenderval = newVal;
        });
      },
    );
  }
}

//******************************************** DOB FIELD CLASS ***************************************************************************************************
class DOBtextfieldWidget extends StatefulWidget {
  const DOBtextfieldWidget({super.key});

  @override
  State<DOBtextfieldWidget> createState() => _DOBtextfieldWidgetState();
}

class _DOBtextfieldWidgetState extends State<DOBtextfieldWidget> {
  late TextEditingController datecontroller;
  DateTime currentDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    datecontroller = TextEditingController(
      text: DateFormat('dd/MM/yyyy').format(currentDate),
    );
  }

  @override
  void dispose() {
    datecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      controller: datecontroller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: ConstantColors.greycolor),
        ),
      ),
      onTap: () async {
        DateTime? newDate = await showDatePicker(
          context: context,
          firstDate: DateTime(1900),
          lastDate: DateTime(2100),
          initialDate: currentDate,
        );
        if (newDate == null) return;

        setState(() {
          currentDate = newDate;
          datecontroller.text = DateFormat('dd/MM/yyyy').format(currentDate);
        });
      },
    );
  }
}

//******************************************** FIELD TTEXT FIELD CLASS ***************************************************************************************************
class FieldTextField extends StatelessWidget {
  const FieldTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: ConstantColors.greycolor),
        ),
      ),
    );
  }
}

//******************************************** FIELD TITLE WIDGET CLASS  ***************************************************************************************************
class FieldTItle extends StatelessWidget {
  final String fieldTitle;
  const FieldTItle({super.key, required this.fieldTitle});

  @override
  Widget build(BuildContext context) {
    return Text(
      fieldTitle,
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    );
  }
}

//******************************************** PROFILE PIC CLASS   ***************************************************************************************************
class ProfilePic extends StatelessWidget {
  const ProfilePic({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(5),
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assests/profilephoto.png'),
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            padding: EdgeInsets.all(6),
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Color(0xffF5F5FF),
            ),
            child: Center(
              child: Icon(
                Icons.camera_alt,
                color: ConstantColors.primarycolor,
                size: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
