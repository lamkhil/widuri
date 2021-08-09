import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widuri/colors.dart';
import 'package:widuri/controller/c_transaksi.dart';
import 'package:widuri/views/Widget/popup_barang.dart';
import 'package:widuri/views/Widget/popup_riwayat.dart';

import 'notif_popup.dart';

class CardRiwayat extends StatelessWidget {
  CardRiwayat({
    required this.namaPenjual,
    required this.tanggal,
    required this.laba,
    required this.hargaDeal,
    required this.listBarang,
  });

  String namaPenjual;
  String tanggal;
  int laba;
  int hargaDeal;
  List listBarang;
  RxInt jumlahTransaksi = 0.obs;
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    C_Transaksi transaksiController =
        C_Transaksi().initialized ? Get.find() : Get.put(C_Transaksi());

    return new Container(
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          child: Padding(
              padding: EdgeInsets.all(12.0),
              child: SizedBox(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          CupertinoIcons.money_dollar_circle,
                          color: Colors.amber,
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        Container(
                          width: w * 0.275,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              FittedBox(
                                child: Text(
                                  namaPenjual,
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Laba : Rp${laba.toString()}',
                                style: TextStyle(
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.w200),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              tanggal,
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Container(
                            width: w * 0.05,
                            child: FittedBox(
                              child: IconButton(
                                onPressed: () {
                                  HistoryBuildShowDialog(
                                      context, laba, hargaDeal, listBarang);
                                },
                                icon: Icon(Icons.arrow_forward_ios_rounded),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ))),
    );
  }
}
