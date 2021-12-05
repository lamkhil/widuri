import 'package:get/get.dart';
import 'package:widuri/controller/controller.dart';

class BarangBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(BarangController());
  }
}
