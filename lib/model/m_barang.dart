import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:translator/translator.dart';
import 'package:widuri/colors.dart';

class M_Barang {
  static final _translator = GoogleTranslator();
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static CollectionReference _barang =
      FirebaseFirestore.instance.collection('barang');
  static Future<List<dynamic>> cekBarang() async {
    var list = [];
    var result = await _barang.get();
    result.docs.forEach((element) {
      list.add({
        'id': element.id,
        'kategori': element['kategori'],
        'namaBarang': element['namaBarang'],
        'hargaAwal': element['hargaAwal'],
        'rekomendasiHarga': element['rekomendasiHarga'],
        'jumlah': element['jumlah']
      });
    });
    return list;
  }

  static Stream<List<dynamic>> getBarangStream() {
    Stream<QuerySnapshot> stream = _barang.snapshots();
    return stream.map((event) {
      if (event.docs.isNotEmpty) {
        return event.docs
            .map((e) => {
                  'id': e.id,
                  'kategori': e['kategori'],
                  'namaBarang': e['namaBarang'],
                  'hargaAwal': e['hargaAwal'],
                  'rekomendasiHarga': e['rekomendasiHarga'],
                  'jumlah': e['jumlah'],
                  'caseSearch': e['caseSearch']
                })
            .toList();
      } else {
        List<dynamic> widget = [1];
        return widget;
      }
    });
  }

  static List<String> setSearchParam(String caseString) {
    List<String> caseSearchList = [];
    String temp = "";
    for (int i = 0; i < caseString.length; i++) {
      temp = temp + caseString[i];
      caseSearchList.add(temp);
    }
    return caseSearchList;
  }

  static Future<dynamic> tambahBarang(String kategori, String namaBarang,
      int hargaAwal, int rekomendasiHarga, int jmlh) async {
    var id = await _barang
        .where('kategori', isEqualTo: kategori.toLowerCase())
        .get();
    var i = id.size;
    if (id.size > 0) {
      i = int.parse(id.docs.last.id.split('-')[1]) + 1;
    }
    var caseSearch = setSearchParam("${kategori.toLowerCase()}-$i");
    caseSearch.addAll(setSearchParam(namaBarang.toLowerCase()));
    bool err = false;
    String error = '';
    id.docs.forEach((element) {
      if (namaBarang.toLowerCase() ==
          element['namaBarang'].toString().toLowerCase()) {
        error = 'Barang Sudah Ada';
        err = true;
      }
    });
    if (err) {
      return error;
    }
    try {
      await _barang.doc("${kategori.toLowerCase()}-$i").set({
        'kategori': kategori.toLowerCase(),
        'namaBarang': namaBarang,
        'hargaAwal': hargaAwal,
        'rekomendasiHarga': rekomendasiHarga,
        'caseSearch': caseSearch,
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
