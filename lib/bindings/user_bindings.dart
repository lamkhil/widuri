import 'package:get/get.dart';
import 'package:widuri/controller/controller.dart';

class UserBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(UserController());
  }
}
