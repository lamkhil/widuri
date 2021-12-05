import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:widuri/Util/request_permission.dart';
import 'package:widuri/colors.dart';
import 'package:widuri/model/m_user.dart';
import 'package:widuri/router/routes.dart';
import 'package:widuri/views/Widget/alert_dialog.dart';
import 'package:widuri/views/Widget/loader_dialog.dart';

class UserController extends GetxController {
  static var name = ''.obs;
  static final storage = GetStorage();
  static final auth = FirebaseAuth.instance;
  static var photoUrl = "".obs;

  static var imagePicker = ImagePicker();
  static late Rx<File> imagePick;

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
          Get.offNamed(Routes.verifyScreen, arguments: nama);
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

  static Future<bool> imgFromCamera(BuildContext context) async {
    if (await requestPermission(Permission.camera)) {
      XFile? image = await imagePicker.pickImage(
          source: ImageSource.camera, imageQuality: 50);
      if (image != null) {
        imagePick = File(image.path).obs;

        uploadImage(context);
        return true;
      }
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> imgFromGallery(BuildContext context) async {
    if (await requestPermission(Permission.accessMediaLocation)) {
      XFile? image = await imagePicker.pickImage(
          source: ImageSource.gallery, imageQuality: 50);
      if (image != null) {
        imagePick = File(image.path).obs;

        uploadImage(context);
        return true;
      }
      return true;
    } else {
      return false;
    }
  }

  static uploadImage(BuildContext context) async {
    loaderDialog(
        context,
        SpinKitFadingCube(
          color: primaryColor,
        ),
        "Upload gambar...");
    try {
      var firebaseStorage = FirebaseStorage.instance;
      await firebaseStorage
          .ref('uploads/${auth.currentUser!.uid}.png')
          .putFile(imagePick.value);

      var url = await firebaseStorage
          .ref('uploads/${auth.currentUser!.uid}.png')
          .getDownloadURL();
      await auth.currentUser!.updatePhotoURL(url);
      photoUrl.value = url;
    } catch (e) {
      print(e);
    }
    Navigator.pop(Get.overlayContext!);
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
        Get.offNamed(Routes.dashboardScreen);
      } else {
        await result.delete();
        Get.toNamed(Routes.registerScreen);
        customDialog(context, "Opps!",
            "Email Anda belum terverifikasi, silahkan ulangi pendaftaran!");
      }
    } else {
      customDialog(context, "Oops!", result);
    }
  }

  static Future<void> ubahNama(BuildContext context, String nama) async {
    var result = await M_User.ubahNama(nama);
    Navigator.of(context).pop();
    if (!(result is String)) {
      Get.offNamed(Routes.dashboardScreen, arguments: nama);
      name.value = auth.currentUser!.displayName!.toString();
    } else {
      customDialog(context, 'Oppss!', result);
    }
  }

  static Future<void> logOutUser(BuildContext context) async {
    var result = await M_User.logOut();
    if (!(result is String)) {
      storage.remove('user');
      Get.offAllNamed(Routes.loginScreen);
    } else {
      customDialog(context, 'Oppss!', result);
    }
  }
}
