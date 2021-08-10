import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:widuri/colors.dart';
import 'package:widuri/model/m_barang.dart';
import 'package:widuri/views/Widget/alert_dialog.dart';
import 'package:widuri/views/Widget/loader_dialog.dart';

// ignore: camel_case_types
class C_Barang extends GetxController {
  var _textController = TextEditingController(text: '0').obs;
  var query = ''.obs;
  final storage = GetStorage();
  var minStock = 3.obs;
  var barangList = <dynamic>[].obs;
  static const List<String> listDropdownHome = [
    'Harian',
    'Mingguan',
    'Bulanan'
  ];
  var valueDropdownHome = listDropdownHome.first.obs;

  @override
  void onInit() {
    minStock.value = storage.read('minStock');
    barangList.bindStream(M_Barang.getBarangStream());
    super.onInit();
  }

  tambahJumlahBarang() {
    String j = _textController.value.text;
    if (j == '') j = '0';
    var a = int.parse(j);
    a++;
    _textController.value.text = a.toString();
  }

  kurangJumlahBarang() {
    String j = _textController.value.text;
    if (j == '') j = '0';
    var a = int.parse(j);
    if (a > 1) {
      a--;
    }
    _textController.value.text = a.toString();
  }

  Rx get textController {
    return _textController;
  }

  static Future<void> hapusBarang(BuildContext context, String id) async {
    loaderDialog(
        context,
        SpinKitFadingCube(
          color: primaryColor,
        ),
        "Tunggu Sebentar!");
    var result = await M_Barang.hapusBarang(id);
    Navigator.of(Get.overlayContext!).pop();
    if (!(result is String)) {
      customDialog(context, "Alhamdulillah!", 'Barang berhasil dihapus');
    } else {
      customDialog(context, "Oops!", result);
    }
  }

  static Future<void> tambahBarang(
      BuildContext context,
      String kategori,
      String namaBarang,
      int hargaAwal,
      int rekomendasiHarga,
      int jmlh,
      String idBarang) async {
    loaderDialog(
        context,
        SpinKitFadingCube(
          color: primaryColor,
        ),
        "Tunggu Sebentar!");
    var result = await M_Barang.tambahBarang(
        kategori, namaBarang, hargaAwal, rekomendasiHarga, jmlh, idBarang);
    Navigator.of(Get.overlayContext!).pop();
    if (!(result is String)) {
      if (idBarang == '') {
        customDialog(context, "Alhamdulillah!", 'Barang berhasil ditambah');
      } else {
        customDialog(context, "Alhamdulillah!", 'Barang berhasil diubah');
      }
    } else {
      customDialog(context, "Oops!", result);
    }
  }
}
