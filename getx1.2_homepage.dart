import 'package:get/get.dart';
class homeController extends GetxController {
  String name = 'Ritu';
  int counter = 0;
  void increament() {
    counter++;
    update();
  }
}
