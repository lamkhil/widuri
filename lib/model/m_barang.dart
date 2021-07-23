import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:translator/translator.dart';

// ignore: camel_case_types
class M_Barang {
  static final _translator = GoogleTranslator();
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static CollectionReference barang =
      FirebaseFirestore.instance.collection('barang');
  static Future<dynamic> getAllBarang() async {
    var result = await barang.get();
    return result.docs;
  }

  static Future<dynamic> tambahBarang(String kategori, String namaBarang,
      int hargaAwal, int rekomendasiHarga, int jmlh) async {
    var id = await barang.get();
    var i = id.size;
    if (id.size > 0) {
      i = int.parse(id.docs.last.id.split('-')[1]) + 1;
    }
    bool err = false;
    String error = '';
    id.docs.forEach((element) {
      if (namaBarang == element['namaBarang']) {
        error = 'Barang Sudah Ada';
        err = true;
      }
    });
    if (err) {
      return error;
    }
    try {
      await barang.doc("${kategori.toLowerCase()}-$i").set({
        'kategori': kategori,
        'namaBarang': namaBarang,
        'hargaAwal': hargaAwal,
        'rekomendasiHarga': rekomendasiHarga,
        'jumlah': jmlh
      });
      return 1;
    } catch (e) {
      var result = await _translator.translate(e.toString().split('] ')[1],
          from: 'en', to: 'id');
      return result.toString();
    }
  }
}
