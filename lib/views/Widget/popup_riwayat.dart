import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../colors.dart';
import '../../gambar.dart';
import '../notif_screen.dart';

Future<dynamic> HistoryBuildShowDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        var w = MediaQuery.of(context).size.width;
        var h = MediaQuery.of(context).size.height;
        return AlertDialog(
          titlePadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          scrollable: true,
          title: Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
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
                    height: h*0.3,
                    width: w,
                    padding: EdgeInsets.all(5),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 6,
                      itemBuilder: (context, index){
                        return Card(
                          child: ListTile(
                            title: Text("Nama barang"),
                            trailing: Text("3 pcs"),
                          ),
                        );
                      },
                    ),
                  )
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Harga deal"),
                    Text("Rp. 1000000"),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Laba"),
                    Text("Rp. 1000000"),
                  ],
                ),
              ],
            ),
          ),
        );
      });
}
