import 'package:get/get.dart';
import 'package:homework_list/view/homepage/controller/hpcontroller.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController());
  }
}
