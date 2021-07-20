import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:widuri/model/m_user.dart';
import 'package:widuri/views/Widget/loader_dialog.dart';

class C_User {
  static Future<void> registerUser(
      BuildContext context, String email, String password, String nama) async {
    loaderDialog(context, SpinKitPumpingHeart(color: Colors.lime[900]),
        'Tunggu Sebentar!');
    var result = await M_User.registerUser(email, password, nama);
    if (result != null) {
      Navigator.of(context).pop();
      Get.offNamed('/verif');
    }
  }
}
