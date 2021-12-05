import 'package:get/get.dart';
import 'package:widuri/controller/controller.dart';

class TransaksiBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TransaksiController());
  }
}
