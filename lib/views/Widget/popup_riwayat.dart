import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widuri/Util/formatCurrency.dart';

import '../../colors.dart';
import '../../gambar.dart';
import '../notif_screen.dart';

Future<dynamic> HistoryBuildShowDialog(
  BuildContext context,
  int laba,
  int hargaDeal,
  List listBarang,
) {
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
        );
      });
}
