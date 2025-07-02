import 'package:get/get.dart';

class Dropdownlocations extends GetxController {

  // the current set location 
  var currentlocation = 'New York City'.obs;
  //list of places or location
  List<String> locations = ['New York City', 'Mumbai', 'Pune', 'Manali'];
  //function that the final location onChange.
  void setlocation(String? value) {
    if (value != null) {
      currentlocation.value = value;
    }
  }
}


