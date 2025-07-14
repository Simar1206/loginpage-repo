import 'package:burgerapp/features/topbarwidget.dart';
import 'package:burgerapp/utils/constants/constant_colors/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SwitchController extends GetxController {
  RxBool currentswitchvalue = false.obs;
  void toggleSwitch(bool newState) {
    currentswitchvalue.value = newState;
    if (newState) {
      Get.snackbar(
        'Push Notification Enabled',
        'You have Enabled Push Notifications',
      );
    } else {
      Get.snackbar(
        'Push Notification Disabled',
        'You have Disabled Push Notifications',
      );
    }
  }
}

class LocationController extends GetxController {
  RxBool currentswitchvalue = false.obs;
  void toggleSwitch(bool newState) {
    currentswitchvalue.value = newState;
    if (newState) {
      Get.snackbar('Location Enabled', 'You have Enabled Location');
    } else {
      Get.snackbar('Location Disabled', 'You have Disabled Location Services');
    }
  }
}

class SettingPage extends StatelessWidget {
  SwitchController switchController = Get.put(SwitchController());
  LocationController locationController = Get.put(LocationController());
  SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 44),
        child: Column(
          children: [
            Topbarwidget(
              firsticon: Icon(Icons.arrow_back_ios),
              lasticon: null,
              title: 'Settings',
              onPress: () {
                Get.toNamed('/home_page');
              },
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'PROFILE',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: ConstantColors.greycolor,
                  ),
                ),
                const SizedBox(height: 8),
                PushNotificationsWidget(switchController: switchController),
                const SizedBox(height: 18),
                LocationWidget(locationController: locationController),
                const SizedBox(height: 18),
                FieldWithSpacingAndIcon(
                  title: 'Language',
                  Preffixlabel: 'English',
                  icon: Icons.keyboard_arrow_right,
                ),
                const SizedBox(height: 28),
                const Text(
                  'OTHER',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: ConstantColors.greycolor,
                  ),
                ),
                const SizedBox(height: 18),
                FieldWithSpacingAndIcon(
                  title: 'About Ticketis',
                  Preffixlabel: null,
                  icon: Icons.keyboard_arrow_right,
                ),
                const SizedBox(height: 8),
                FieldWithSpacingAndIcon(
                  title: 'Privacy Policy',
                  Preffixlabel: null,
                  icon: Icons.keyboard_arrow_right,
                ),
                const SizedBox(height: 8),
                FieldWithSpacingAndIcon(
                  title: 'Terms And Conditions',
                  Preffixlabel: null,
                  icon: Icons.keyboard_arrow_right,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//************************************************************************************************************************************************************ */
class FieldWithSpacingAndIcon extends StatelessWidget {
  final String title;
  String? Preffixlabel;
  IconData icon;
  FieldWithSpacingAndIcon({
    super.key,
    required this.title,
    required this.Preffixlabel,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        Row(
          children: [
            Preffixlabel != null
                ? Text(
                    Preffixlabel!,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  )
                : SizedBox.shrink(),

            const SizedBox(width: 25),
            Icon(icon),
          ],
        ),
      ],
    );
  }
}

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key, required this.locationController});

  final LocationController locationController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Location',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        Obx(
          () => Switch(
            inactiveThumbColor: ConstantColors.headlinecolor,
            inactiveTrackColor: Color(0xffDFE0F3),

            activeTrackColor: ConstantColors.primarycolor,
            value: locationController.currentswitchvalue.value,
            onChanged: locationController.toggleSwitch,
          ),
        ),
      ],
    );
  }
}

class PushNotificationsWidget extends StatelessWidget {
  const PushNotificationsWidget({super.key, required this.switchController});

  final SwitchController switchController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Push Notfication',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        Obx(
          () => Switch(
            inactiveThumbColor: ConstantColors.headlinecolor,
            inactiveTrackColor: Color(0xffDFE0F3),

            activeTrackColor: ConstantColors.primarycolor,
            value: switchController.currentswitchvalue.value,
            onChanged: switchController.toggleSwitch,
          ),
        ),
      ],
    );
  }
}
