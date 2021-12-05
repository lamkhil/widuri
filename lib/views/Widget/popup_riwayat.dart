import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widuri/Util/formatCurrency.dart';
import 'package:widuri/controller/c_transaksi.dart';

import '../../colors.dart';

Future<dynamic> HistoryBuildShowDialog(
  BuildContext context,
  int laba,
  int hargaDeal,
  String id,
  List listBarang,
) {
  bool hapus = false;
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        var w = MediaQuery.of(context).size.width;
        var h = MediaQuery.of(context).size.height;
        return AlertDialog(
          titlePadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          scrollable: true,
          title: Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10), topLeft: Radius.circular(10)),
              color: primaryColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Detail Transaksi',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20.0,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          content: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("List Barang"),
                SizedBox(
                  height: 10,
                ),
                Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Container(
                      height: h * 0.3,
                      width: w,
                      padding: EdgeInsets.all(5),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: listBarang.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text(listBarang[index]['namaBarang']),
                              trailing: Text(listBarang[index]
                                      ['jumlahTransaksi']
                                  .toString()),
                            ),
                          );
                        },
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Harga deal"),
                    Text(formatCurrency.format(hargaDeal).toString()),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Laba"),
                    Text(formatCurrency.format(laba).toString()),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            Container(
              height: h * 0.05,
              width: w,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide(color: primaryColor)),
                    primary: backgroundColor,
                  ),
                  onPressed: () {
                    hapus = true;
                    Navigator.pop(Get.overlayContext!);
                  },
                  child: Text(
                    'Hapus Transaksi',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Roboto',
                        fontSize: 16.0,
                        color: primaryColor),
                  )),
            ),
            Container(
              height: h * 0.05,
              width: w,
              margin: EdgeInsets.only(top: h * 0.01),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    primary: primaryColor,
                  ),
                  onPressed: () {
                    Navigator.pop(Get.overlayContext!);
                  },
                  child: Text(
                    'Tutup',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Roboto',
                      fontSize: 16.0,
                    ),
                  )),
            )
          ],
        );
      }).then((value) {
    if (hapus) {
      _verifHapus(context, id);
    }
  });
}

void _verifHapus(BuildContext context, String id) {
  bool _hapus = false;
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(
              'Peringatan!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            content: Text("Yakin ingin hapus transaksi ini?"),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide(color: primaryColor)),
                    primary: backgroundColor,
                  ),
                  onPressed: () {
                    _hapus = true;
                    Navigator.pop(Get.overlayContext!);
                  },
                  child: Text(
                    'Ya',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Roboto',
                        fontSize: 16.0,
                        color: primaryColor),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    primary: primaryColor,
                  ),
                  onPressed: () {
                    _hapus = false;
                    Navigator.pop(Get.overlayContext!);
                  },
                  child: Text(
                    'Tidak',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Roboto',
                      fontSize: 16.0,
                    ),
                  ))
            ],
          )).whenComplete(() {
    if (_hapus) {
      try {
        TransaksiController.hapusTransaksi(context, id);
      } catch (e) {
        print(e);
      }
    }
  });
}
