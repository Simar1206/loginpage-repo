import 'package:burgerapp/features/auth/widgets/dropdown.dart';
import 'package:burgerapp/utils/constants/constant_colors/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homeheader extends StatelessWidget {
  final Dropdownlocations ddl = Get.put(Dropdownlocations());
  Homeheader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assests/homebackground2.png',
          ), // ✅ make sure spelling is correct
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row: location + icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // LEFT: Location Dropdown + City Name
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropdownButton<String>(
                      iconEnabledColor: Colors.white,
                      underline: SizedBox.shrink(),
                      icon: const Icon(Icons.arrow_drop_down),
                      hint: const Text(
                        "Your Location",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      items: ddl.locations
                          .map(
                            (location) => DropdownMenuItem(
                              value: location,
                              child: Text(location),
                            ),
                          )
                          .toList(),
                      onChanged: ddl.setlocation,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: Colors.white,
                          size: 24,
                        ),
                        const SizedBox(width: 4),
                        Obx(
                          () => Text(
                            ddl.currentlocation.value,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: ConstantColors.headlinecolor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                // RIGHT: Notification and Search Icons
                Row(
                  children: [
                    Image.asset(
                      'assests/Search.png',
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 12),
                    Image.asset(
                      'assests/Notification.png',
                      height: 50,
                      width: 45,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Text: "Provide the Best Food For You"
            const Text(
              "Provide the Best\nFood For You",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
