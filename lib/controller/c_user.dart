import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:widuri/model/m_user.dart';
import 'package:widuri/views/Widget/loader_dialog.dart';

class C_User {
  static final storage = GetStorage();
  static Future<void> registerUser(
      BuildContext context, String email, String password, String nama) async {
    loaderDialog(context, SpinKitFadingCube(color: Colors.lime[900]),
        'Tunggu Sebentar!');
    var result = await M_User.registerUser(email, password, nama);
    if (result != null) {
      Navigator.of(context).pop();
      storage.write('email', email);
      Get.offNamed('/verif', arguments: nama);
    }
  }
}
