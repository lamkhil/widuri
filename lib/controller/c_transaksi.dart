import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:widuri/colors.dart';
import 'package:widuri/controller/c_barang.dart';
import 'package:widuri/model/m_barang.dart';
import 'package:widuri/model/m_transaksi.dart';
import 'package:widuri/views/Widget/alert_dialog.dart';
import 'package:widuri/views/Widget/loader_dialog.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types
class C_Transaksi extends GetxController {
  var date = ''.obs;
  var controllerCatatan = TextEditingController().obs;
  var controllerHarga = TextEditingController().obs;
  var catatan = ''.obs;
  var barang = {}.obs;
  var isTambah = true.obs;
  final listTransaksi = [].obs;
  var dataGrafik = {}.obs;

  @override
  void onInit() {
    listTransaksi.bindStream(M_Transaksi.getTransaksiStream());
    updateDataGrafik();
    super.onInit();
  }

  void reset() {
    date.value = '';
    controllerCatatan.value.text = '';
    controllerHarga.value.text = '';
    catatan.value = '';
    barang.value = {};
    refresh();
  }

  updateDataGrafik() async {
    C_Barang barangController =
        C_Barang().initialized ? Get.find() : Get.put(C_Barang());
    var date = DateTime.now();
    var end = date;
    var start = DateTime(date.year, date.month, date.day);
    switch (barangController.valueDropdownHome.value) {
      case 'Harian':
        end = DateTime(date.year, date.month, date.day - 7);
        break;
      case 'Mingguan':
        end = DateTime(date.year, date.month, date.day - 7 * 7);
        break;
      case 'Bulanan':
        end = DateTime(date.year, date.month - 7, date.day);
        break;
    }
    var listDate = List.generate(
        start.difference(end).inDays,
        (i) => DateFormat("dd-MM-yyyy")
            .format(DateTime(start.year, start.month, start.day - (i))));
    var result = await M_Transaksi.getTransaksi(listDate) as List;
    List laba = [0, 0, 0, 0, 0, 0, 0];
    List hargaDeal = [0, 0, 0, 0, 0, 0, 0];
    var bottomTiles = ['', '', '', '', '', '', ''];
    switch (barangController.valueDropdownHome.value) {
      case 'Harian':
        for (var i = 0; i < 7; i++) {
          var temp = result
              .where(
                  (element) => element.values.first['tanggal'] == listDate[i])
              .toList();
          if (temp.isNotEmpty) {
            for (var item in temp) {
              laba[i] += item.values.first['laba'];
              hargaDeal[i] += item.values.first['hargaDeal'];
            }
          }
          bottomTiles[i] = listDate[i];
        }

        break;
      case 'Mingguan':
        for (var i = 0; i < 7; i++) {
          bottomTiles[i] = listDate[i * 7 + 1];
          var jarak = i == 0 ? listDate[0] : bottomTiles[i - 1];
          var count = DateFormat("dd-MM-yyyy")
                  .parse(jarak)
                  .difference(DateFormat("dd-MM-yyyy").parse(bottomTiles[i]))
                  .inDays +
              (i == 0 ? 1 : 0);
          for (var j = 0; j < count; j++) {
            var temp = result
                .where((element) =>
                    element.values.first['tanggal'] == listDate[i * 7 + 1 - j])
                .toList();
            if (temp.isNotEmpty) {
              for (var item in temp) {
                laba[i] += item.values.first['laba'];
                hargaDeal[i] += item.values.first['hargaDeal'];
              }
            }
          }
        }
        break;
      case 'Bulanan':
        end = DateTime(date.year, date.month - 7, date.day);
        break;
    }
    int i =
        hargaDeal.reduce((value, element) => value > element ? value : element);
    var z = (i ~/ (4 * pow(10, i.toString().length - 1) as int)) *
            (4 * pow(10, i.toString().length - 1) as int) +
        (4 * pow(10, i.toString().length - 1) as int);
    var leftTiles = [z, z * 0.75, z * 0.5, z * 0.25];

    dataGrafik.value = {
      'leftTiles': leftTiles,
      'bottomTiles': bottomTiles,
      'laba': laba,
      'hargaDeal': hargaDeal
    };
  }

  Future<void> tambahTransaksi(BuildContext context) async {
    loaderDialog(
        context,
        SpinKitFadingCube(
          color: primaryColor,
        ),
        "Tunggu Sebentar");
    barang.forEach((key, value) async {
      await M_Barang.tambahBarang(value['kategori'], value['namaBarang'],
          value['hargaAwal'], value['rekomendasiHarga'], value['jumlah'], key);
    });
    int laba = hargaDeal() - jumlahHargaAwal();
    var result = await M_Transaksi.TambahTransaksi(
        laba, hargaDeal(), catatan.value, date.value, barang);
    Navigator.pop(Get.overlayContext!);
    if (!(result is String)) {
      customDialog(context, "Alhamdulillah!", 'Transaksi Berhasil');
    } else {
      customDialog(context, "Oops!", result.toString());
    }
    reset();
  }

  int jumlahRekomendasiHarga() {
    int rekomendasi = 0;
    barang.values.forEach((element) {
      rekomendasi +=
          element['rekomendasiHarga'] * element['jumlahTransaksi'] as int;
    });
    return rekomendasi;
  }

  int jumlahHargaAwal() {
    int hargaAwal = 0;
    barang.values.forEach((element) {
      hargaAwal += element['hargaAwal'] * element['jumlahTransaksi'] as int;
    });
    return hargaAwal;
  }

  int hargaDeal() {
    var hargaDeal = controllerHarga.value.text == ''
        ? jumlahRekomendasiHarga()
        : int.parse(controllerHarga.value.text);
    return hargaDeal;
  }
}
