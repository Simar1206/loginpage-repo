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
          image: AssetImage('assests/homebackground2.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
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

                Row(
                  children: [
                    //*Search Icon:
                    SearchHeaderIcon(icon: Icons.search),

                    const SizedBox(width: 12),
                    SearchHeaderIcon(icon: Icons.notifications_outlined),
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

class SearchHeaderIcon extends StatelessWidget {
  final IconData icon;
  const SearchHeaderIcon({required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(11),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: ConstantColors.headlinecolor),
      ),
      width: 40,
      height: 40,
      child: Icon(icon, color: ConstantColors.headlinecolor, size: 24),
    );
  }
}
