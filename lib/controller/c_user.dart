import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:widuri/colors.dart';
import 'package:widuri/model/m_user.dart';
import 'package:widuri/views/Widget/alert_dialog.dart';
import 'package:widuri/views/Widget/loader_dialog.dart';

class C_User {
  static final storage = GetStorage();
  static Future<void> registerUser(
      BuildContext context, String email, String password, String nama) async {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (email != "" && password != "" && nama != "") {
      if (emailValid) {
        loaderDialog(context, SpinKitFadingCube(color: primaryColor),
            'Tunggu Sebentar!');
        var result = await M_User.registerUser(email, password, nama);
        Navigator.of(context).pop();
        if (!(result is String)) {
          storage.write('email', email);
          Get.offNamed('/verif', arguments: nama);
          storage.write('user', result.uid);
        } else {
          customDialog(context, "Oops!", result);
        }
      } else {
        customDialog(context, "Oops!", "Email tidak semestinya");
      }
    } else {
      customDialog(context, "Oops!", "Lengkapi Formnya dulu");
    }
  }

  static Future<void> lupaPassword(BuildContext context, String email) async {
    loaderDialog(
        context, SpinKitFadingCube(color: primaryColor), 'Tunggu Sebentar!');
    var result = await M_User.lupaPassword(email);
    Navigator.of(context).pop();
    if (!(result is String)) {
      customDialog(context, "Succes!", "Berhasil, Silahkan cek email anda!");
    } else {
      customDialog(context, "Oops!", result);
    }
  }

  static Future<void> loginUser(
      BuildContext context, String email, String password) async {
    loaderDialog(
        context, SpinKitFadingCube(color: primaryColor), 'Tunggu Sebentar!');
    var result = await M_User.loginUser(email, password);
    Navigator.of(context).pop();
    if (!(result is String)) {
      await result.reload();
      if (result.emailVerified) {
        storage.write('user', result.uid);
        Get.offNamed('/main');
      } else {
        await result.delete();
        Get.toNamed('/register');
        customDialog(context, "Opps!",
            "Email Anda belum terverifikasi, silahkan ulangi pendaftaran!");
      }
    } else {
      customDialog(context, "Oops!", result);
    }
  }
  static Future <void> logOutUser(BuildContext context)async{
    var result = await M_User.logOut();
    if (!(result is String)) {
      storage.remove('user');
      Get.offNamed('/login');
    }
  }
}
