import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:widuri/colors.dart';
import 'package:widuri/model/m_barang.dart';
import 'package:widuri/model/m_user.dart';
import 'package:widuri/views/Widget/alert_dialog.dart';
import 'package:widuri/views/Widget/loader_dialog.dart';

// ignore: camel_case_types
class C_Barang extends GetxController {
  var _textController = TextEditingController(text: '1').obs;
  var barangList = <dynamic>[].obs;
  static var isLoadingStatic = false.obs;

  @override
  void onInit() {
    barangList.bindStream(M_Barang.getBarangStream());
    super.onInit();
  }

  tambahJumlahBarang() {
    String j = _textController.value.text;
    if (j == '') j = '1';
    var a = int.parse(j);
    a++;
    _textController.value.text = a.toString();
  }

  kurangJumlahBarang() {
    String j = _textController.value.text;
    if (j == '') j = '1';
    var a = int.parse(j);
    if (a > 1) {
      a--;
    }
    _textController.value.text = a.toString();
  }

  Rx get textController {
    return _textController;
  }

  static Future<void> tambahBarang(BuildContext context, String kategori,
      String namaBarang, int hargaAwal, int rekomendasiHarga, int jmlh) async {
    isLoadingStatic.value = true;
    var id = kategori + 1.toString();
    var result = await M_Barang.tambahBarang(
        kategori, namaBarang, hargaAwal, rekomendasiHarga, jmlh);
    isLoadingStatic.value = false;
    Navigator.of(context).pop();
    if (!(result is String)) {
      customDialog(context, "Alhamdulillah!", 'Barang berhasil ditambah');
    } else {
      customDialog(context, "Oops!", result);
    }
  }
}
