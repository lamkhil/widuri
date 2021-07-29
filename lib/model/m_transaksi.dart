import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:translator/translator.dart';
import 'package:widuri/views/tambah_transaksi.dart';

class M_Transaksi {
  static final auth = FirebaseAuth.instance;
  static final _translator = GoogleTranslator();
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static CollectionReference _transaksi =
      FirebaseFirestore.instance.collection('transaksi');
  static Future<dynamic> TambahTransaksi(int laba, int hargaDeal,
      String catatan, String date, Map<dynamic, dynamic> barang) async {
    var id = await _transaksi.where('tanggal', isEqualTo: date).get();
    var i = id.size;
    if (id.size > 0) {
      i = int.parse(id.docs.last.id.split('-')[1]) + 1;
    }
    var idTransaksi = "$date-$i";
    try {
      await _transaksi.doc(idTransaksi).set({
        'barang': barang,
        'tanggal': date,
        'penjual': auth.currentUser!.displayName,
        'catatan': catatan,
        'hargaDeal': hargaDeal,
        'laba': laba,
      });
      return 1;
    } catch (e) {
      var result = await _translator.translate(e.toString().split('] ')[1],
          from: 'en', to: 'id');
      return result.toString();
    }
  }
}
