import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:translator/translator.dart';

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
      i = int.parse(id.docs.last.id.split('#')[1]) + 1;
    }
    var idTransaksi = "$date#$i";
    try {
      await _transaksi.doc(idTransaksi).set({
        'barang': barang,
        'tanggal': date,
        'penjual': auth.currentUser!.displayName,
        'catatan': catatan,
        'hargaDeal': hargaDeal,
        'laba': laba,
        'dibuat': DateTime.now()
      });
      return 1;
    } catch (e) {
      var result = await _translator.translate(e.toString().split('] ')[1],
          from: 'en', to: 'id');
      return result.toString();
    }
  }

  static Future<dynamic> getTransaksi(List date) async {
    try {
      var result = await _transaksi.get();
      return result.docs
          .map((e) => {
                e.id: {
                  'barang': e['barang'],
                  'catatan': e['catatan'],
                  'hargaDeal': e['hargaDeal'],
                  'laba': e['laba'],
                  'penjual': e['penjual'],
                  'tanggal': e['tanggal'],
                  'dibuat': e['dibuat']
                }
              })
          .toList()
          .where((element) => date.contains(element.values.first['tanggal']))
          .toList();
    } catch (e) {
      var result = await _translator.translate(e.toString().split('] ')[1],
          from: 'en', to: 'id');
      return result.toString();
    }
  }

  static Stream<List<dynamic>> getTransaksiStream() {
    Stream<QuerySnapshot> stream = _transaksi.snapshots();
    return stream.map((event) {
      if (event.docs.isNotEmpty) {
        return event.docs
            .map((e) => {
                  e.id: {
                    'barang': e['barang'],
                    'catatan': e['catatan'],
                    'hargaDeal': e['hargaDeal'],
                    'laba': e['laba'],
                    'penjual': e['penjual'],
                    'tanggal': e['tanggal'],
                    'dibuat': e['dibuat']
                  }
                })
            .toList();
      } else {
        List<dynamic> widget = [1];
        return widget;
      }
    });
  }
}
