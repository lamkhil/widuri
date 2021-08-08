import 'dart:collection';
import 'dart:io';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart';
import 'package:excel/excel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:widuri/Util/request_permission.dart';
import 'package:widuri/colors.dart';
import 'package:widuri/controller/c_barang.dart';
import 'package:widuri/model/m_barang.dart';
import 'package:widuri/model/m_transaksi.dart';
import 'package:widuri/views/Widget/alert_dialog.dart';
import 'package:widuri/views/Widget/loader_dialog.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import "package:universal_html/html.dart" as html;

import 'c_user.dart';

// ignore: camel_case_types
class C_Transaksi extends GetxController {
  final auth = FirebaseAuth.instance;
  var date = ''.obs;
  var controllerCatatan = TextEditingController().obs;
  var controllerHarga = TextEditingController().obs;
  var catatan = ''.obs;
  var barang = {}.obs;
  var isTambah = true.obs;
  final listTransaksi = [].obs;
  var dataGrafik = {}.obs;
  var analisisCategory = 0.obs;
  late Rx<DateTimeRange> dateAnalisis;
  var activeCategory = 0.obs;
  var analisis = {}.obs;
  var listDateAnlisis = [].obs;
  var keuntunganUser = 0.obs;

  @override
  void onInit() {
    dateAnalisis = DateTimeRange(
            end: getDate(DateTime.now().add(
                Duration(days: DateTime.daysPerWeek - DateTime.now().weekday))),
            start: getDate(DateTime.now()
                .subtract(Duration(days: DateTime.now().weekday - 1))))
        .obs;
    listTransaksi.bindStream(M_Transaksi.getTransaksiStream());
    updateDataGrafik();
    listTransaksi.listen((value) {
      getPendapatanUser();
      updateDataGrafik();
    });
    dateAnalisis.listen((value) {
      updateDataAnalisis();
    });
    super.onInit();
  }

  DateTime getDate(DateTime d) => DateTime(d.year, d.month, d.day);

  getPendapatanUser() async {
    var a = 0;
    var result = await M_Transaksi.getTransaksi(
        [DateFormat("dd-MM-yyyy").format(DateTime.now())]) as List;
    result.forEach((element) {
      if (element.values.first['penjual'] == auth.currentUser!.displayName) {
        a += element.values.first['laba'] as int;
      }
    });
    keuntunganUser.value = a;
  }

  void reset() {
    date.value = '';
    controllerCatatan.value.text = '';
    controllerHarga.value.text = '';
    catatan.value = '';
    barang.value = {};
    refresh();
  }

  updateDataAnalisis() async {
    var pemasukan = 0;
    var pengeluaran = 0;
    var keungtungan = 0;
    var barangTerlaris = {};
    listDateAnlisis.value = List.generate(
        dateAnalisis.value.end.difference(dateAnalisis.value.start).inDays,
        (i) => DateFormat("dd-MM-yyyy").format(DateTime(
            dateAnalisis.value.end.year,
            dateAnalisis.value.end.month,
            dateAnalisis.value.end.day - (i))));
    var result = await M_Transaksi.getTransaksi(listDateAnlisis) as List;
    result.forEach((element) {
      var barang = element.values.first['barang'] as Map;
      barang.forEach((key, value) {
        if (barangTerlaris.keys.contains(value['namaBarang'])) {
          barangTerlaris[value['namaBarang']] += value['jumlahTransaksi'];
        } else {
          barangTerlaris
              .addAll({value['namaBarang']: value['jumlahTransaksi']});
        }
      });
      pemasukan += element.values.first['hargaDeal'] as int;
      pengeluaran += (element.values.first['hargaDeal'] -
          element.values.first['laba']) as int;
      keungtungan += element.values.first['laba'] as int;
    });
    var jmlhTerlaris = 0;
    var keyTerlaris = '';

    barangTerlaris.forEach((key, value) {
      if (value > jmlhTerlaris) {
        jmlhTerlaris = value;
        keyTerlaris = key;
      }
    });
    if (jmlhTerlaris == 0) {
      keyTerlaris = 'Tidak ada Transaksi';
    }
    analisis.value = {
      'pemasukan': pemasukan,
      'pengeluaran': pengeluaran,
      'keuntungan': keungtungan,
      'namaBarangTerlaris': keyTerlaris,
      'jumlahBarangTerlaris': jmlhTerlaris
    };
  }

  updateDataGrafik() async {
    C_Barang barangController =
        C_Barang().initialized ? Get.find() : Get.put(C_Barang());
    var date = DateTime.now();
    var end = date;
    var start = DateTime(date.year, date.month, date.day);
    List<String> months = [
      '',
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'Mei',
      'Jun',
      'Jul',
      'Agu',
      'Sep',
      'Okt',
      'Nov',
      'Des'
    ];
    switch (barangController.valueDropdownHome.value) {
      case 'Harian':
        end = DateTime(date.year, date.month, date.day - 7);
        break;
      case 'Mingguan':
        end = DateTime(date.year, date.month, date.day - 7 * 7);
        break;
      case 'Bulanan':
        end = DateTime(date.year, date.month - 6, 0);
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
          var bottomTile = listDate[i].split('-');
          bottomTiles[i] = int.parse(bottomTile[0]).toString() +
              ' ' +
              months[int.parse(bottomTile[1])];
        }

        break;
      case 'Mingguan':
        var weekDate = ['', '', '', '', '', '', ''];
        for (var i = 0; i < 7; i++) {
          var bottomTile = listDate[i * 7 + 1].split('-');
          bottomTiles[i] = int.parse(bottomTile[0]).toString() +
              ' ' +
              months[int.parse(bottomTile[1])];
          weekDate[i] = listDate[i * 7 + 1];
          var jarak = i == 0 ? listDate[0] : weekDate[i - 1];
          var count = DateFormat("dd-MM-yyyy")
                  .parse(jarak)
                  .difference(DateFormat("dd-MM-yyyy").parse(weekDate[i]))
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
        List<List> monthDate = [];
        int bulanIni = int.parse(listDate[0].split('-')[1]);
        for (var i = 0; i < 7; i++) {
          bottomTiles[i] = months[bulanIni - i];
          monthDate.add(listDate
              .where((element) =>
                  months[int.parse(element.split('-')[1])] ==
                  months[bulanIni - i])
              .toList());
          for (var j = 0; j < monthDate[i].length; j++) {
            var temp = result
                .where((element) =>
                    element.values.first['tanggal'] == monthDate[i][j])
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
    }
    int i = laba.reduce((value, element) => value > element ? value : element);
    var z = (i ~/ (4 * pow(10, i.toString().length - 1) as int)) *
            (4 * pow(10, i.toString().length - 1) as int) +
        (4 * pow(10, i.toString().length - 1) as int);
    var leftTiles = [z, z * 0.75, z * 0.5, z * 0.25];

    dataGrafik.value = {
      'leftTiles': leftTiles,
      'bottomTiles': bottomTiles.reversed.toList(),
      'laba': laba.reversed.toList(),
      'hargaDeal': hargaDeal.reversed.toList(),
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

  catatTransaksi(BuildContext context) async {
    var column = ['A', 'B', 'C', 'D', 'E'];
    var date = dateAnalisis.value;
    var start = DateFormat('dd/MM/yyyy').format(date.start);
    var end = DateFormat('dd/MM/yyyy').format(date.end);
    var directory = Directory('');
    String label = "$start - $end";
    var excel =
        Excel.createExcel(); // automatically creates 1 empty sheet: Sheet1
    Sheet r = excel['Sheet1'];
    //Judul
    r.merge(CellIndex.indexByString("A2"), CellIndex.indexByString("E2"),
        customValue: "Catatan Transaksi Widuri");
    r.merge(CellIndex.indexByString("A3"), CellIndex.indexByString("E3"),
        customValue: "$label");
    r.cell(CellIndex.indexByString("A2")).cellStyle = CellStyle(
        bold: true,
        horizontalAlign: HorizontalAlign.Center,
        verticalAlign: VerticalAlign.Center);
    r.cell(CellIndex.indexByString("A3")).cellStyle = CellStyle(
        horizontalAlign: HorizontalAlign.Center,
        verticalAlign: VerticalAlign.Center);
    //header kolom
    r.cell(CellIndex.indexByString("A5")).value = 'NO.';
    r.cell(CellIndex.indexByString("B5")).value = 'ID TRANSAKSI';
    r.cell(CellIndex.indexByString("C5")).value = 'BARANG';
    r.cell(CellIndex.indexByString("D5")).value = 'JUMLAH';
    r.cell(CellIndex.indexByString("E5")).value = 'CATATAN';
    for (var i = 0; i < column.length; i++) {
      r.cell(CellIndex.indexByString("${column[i]}5")).cellStyle = CellStyle(
          bold: true,
          horizontalAlign: HorizontalAlign.Center,
          verticalAlign: VerticalAlign.Center,
          backgroundColorHex: '#00FF00');
    }
    //isi
    var row = 6;
    listDateAnlisis.value = List.generate(
        dateAnalisis.value.end.difference(dateAnalisis.value.start).inDays,
        (i) => DateFormat("dd-MM-yyyy").format(DateTime(
            dateAnalisis.value.end.year,
            dateAnalisis.value.end.month,
            dateAnalisis.value.end.day - (i))));
    var result = await M_Transaksi.getTransaksi(listDateAnlisis) as List;
    int n = 1;
    result.forEach((element) {
      r.cell(CellIndex.indexByString("${column[0]}$row")).value = n;
      r.cell(CellIndex.indexByString("${column[1]}$row")).value =
          element.keys.first;
      var barang = element.values.first['barang'] as Map;
      if (barang.length > 1) {
        var catatan = element.values.first['catatan'];
        r.merge(CellIndex.indexByString("${column[4]}$row"),
            CellIndex.indexByString("${column[4]}${row + barang.length - 1}"),
            customValue: "${catatan != null ? catatan : ""}");
      }
      final barangReverse = LinkedHashMap.fromEntries(barang.entries.toList().reversed);
      barangReverse.forEach((key, value) {
        r.cell(CellIndex.indexByString("${column[2]}$row")).value =
            value['namaBarang'];
        r.cell(CellIndex.indexByString("${column[3]}$row")).value =
            value['jumlahTransaksi'];
        row++;
      });
      r.cell(CellIndex.indexByString("${column[3]}$row")).value =
          'Total Harga:';
      r.cell(CellIndex.indexByString("${column[4]}$row")).value =
          element.values.first['hargaDeal'];
      row++;
      r.cell(CellIndex.indexByString("${column[3]}$row")).value = 'Laba:';
      r.cell(CellIndex.indexByString("${column[4]}$row")).value =
          element.values.first['laba'];
      row++;
      n++;
    });
    //export
    if (kIsWeb) {
      final bytes = excel.encode();
      final blob = html.Blob([bytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.document.createElement('a') as html.AnchorElement
        ..href = url
        ..style.display = 'none'
        ..download = 'widuri ($label).xlsx';
      html.document.body!.children.add(anchor);

// download
      anchor.click();

// cleanup
      html.document.body!.children.remove(anchor);
      html.Url.revokeObjectUrl(url);
    } else {
      if (Platform.isAndroid) {
        //for phone
        try {
          if (await requestPermission(Permission.storage)) {
            Directory? tempPath = await getExternalStorageDirectory();
            String nwDirectory =
                tempPath!.path.split('Android')[0] + "Widuri Apps";
            directory = Directory(nwDirectory);
          } else {
            customDialog(context, "Gagal!", "Izin penyimpanan ditolak");
          }
        } catch (e) {
          print(e);
        }
      }
      try {
        if (await requestPermission(Permission.manageExternalStorage)) {
          loaderDialog(
              context,
              SpinKitFadingCube(
                color: primaryColor,
              ),
              "Tunggu Sebentar!");
          var specialName = label.replaceAll('/', '');
          String path = "${directory.path}/widuri ($specialName).xlsx";
          if (await directory.exists()) {
            File(join(path))
              ..createSync(recursive: true)
              ..writeAsBytesSync(excel.encode()!);
            Navigator.pop(Get.overlayContext!);
            customDialog(context, "Alhamdulillah!",
                "Berhasil simpan catatan transaksi\n$path");
          } else {
            await directory.create(recursive: true);
            File(join(path))
              ..createSync(recursive: true)
              ..writeAsBytesSync(excel.encode()!);
            Navigator.pop(Get.overlayContext!);
            customDialog(context, "Alhamdulillah!",
                "Berhasil simpan catatan transaksi\n$path");
          }
        } else {
          customDialog(context, "Gagal!", "Izin penyimpanan ditolak");
        }
      } catch (e) {
        print(e);
      }
    }
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
