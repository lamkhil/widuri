import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:widuri/colors.dart';
import 'package:widuri/model/m_barang.dart';
import 'package:widuri/model/m_transaksi.dart';
import 'package:widuri/views/Widget/alert_dialog.dart';
import 'package:widuri/views/Widget/loader_dialog.dart';

// ignore: camel_case_types
class C_Transaksi extends GetxController {
  var date = ''.obs;
  var controllerCatatan = TextEditingController().obs;
  var controllerHarga = TextEditingController().obs;
  var catatan = ''.obs;
  var barang = {}.obs;
  var isTambah = true.obs;

  void reset() {
    date.value = '';
    controllerCatatan.value.text = '';
    controllerHarga.value.text = '';
    catatan.value = '';
    barang.value = {};
    refresh();
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
