import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:widuri/colors.dart';
import 'package:widuri/controller/c_barang.dart';
import 'package:widuri/views/Widget/popup_barang.dart';

import 'Widget/card_barang.dart';
import 'Widget/notif_popup.dart';

class DaftarBarang extends StatefulWidget {
  const DaftarBarang({Key? key}) : super(key: key);

  @override
  _DaftarBarangState createState() => _DaftarBarangState();
}

class _DaftarBarangState extends State<DaftarBarang>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    BodyBarang.k.dispose();
    BodyBarang.n.dispose();
    BodyBarang.hA.dispose();
    BodyBarang.rH.dispose();
    BodyBarang.jmlh.dispose();
    BodyBarang.barangController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        floatingActionButton: Padding(
          padding: EdgeInsets.only(
            bottom: 23.0,
          ),
          child: FloatingActionButton.extended(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            onPressed: () {
              PopUpBarang(edit: false, context: context).popUpTambahBarang();
            },
            label: const Text('Tambah Barang'),
            icon: const Icon(Icons.add_circle_rounded),
            backgroundColor: primaryColor,
          ),
        ),
        appBar: AppBar(
          title: Container(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Stock Barang',
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'RobotoMono',
                      color: Colors.black),
                ),
                // Card(
                //   color: backgroundColor,
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(12.0),
                //   ),
                //   child: IconButton(
                //     onPressed: () {
                //       NotifBuildShowDialog(context);
                //     },
                //     icon: Icon(
                //       Icons.notifications,
                //       size: 20.0,
                //       color: primaryColor,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: BodyBarang.bodyDaftarBarang(context));
  }
}

class BodyBarang {
  static final k = TextEditingController();
  static final n = TextEditingController();
  static final hA = TextEditingController();
  static final rH = TextEditingController();
  static final jmlh = C_Barang();
  static final barangController = Get.put(C_Barang());

  static Widget bodyDaftarBarang(BuildContext context,
      [bool transaksi = false]) {
    return Container(
        child: Padding(
      padding: EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            child: new ListTile(
              leading: new Icon(Icons.search),
              title: new TextField(
                autofocus: false,
                decoration: new InputDecoration(
                    hintText: 'Search', border: InputBorder.none),
                // onChanged: onSearchTextChanged,
                onChanged: (value) {
                  barangController.query.value = value.toLowerCase();
                },
              ),
              trailing: new IconButton(
                icon: new Icon(Icons.filter_list_rounded),
                onPressed: () {},
              ),
            ),
          ),
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.all(12),
              child: Text(
                'Daftar Barang',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'RobotoMono',
                    color: Colors.black),
              )),
          Expanded(
            child: Obx(() {
              if (barangController.barangList.isEmpty) {
                return Center(
                    child: SpinKitFadingCube(
                  color: primaryColor,
                ));
              } else {
                var viewList = [];
                if (barangController.query.value == '') {
                  viewList = barangController.barangList;
                } else {
                  if (!(barangController.barangList.value[0] is int)) {
                    if (barangController.barangList
                        .where((value) => value['caseSearch']
                            .contains(barangController.query.value))
                        .isEmpty) {
                      return Text('Barang tidak ditemukan');
                    } else {
                      viewList = barangController.barangList
                          .where((value) => value['caseSearch']
                              .contains(barangController.query.value))
                          .toList();
                    }
                  } else {
                    return Text('Masih Belum ada barang');
                  }
                }
                if (viewList[0] is int) {
                  return Text('Belum ada barang');
                } else {
                  return ListView.builder(
                      itemCount: viewList.length + 1,
                      itemBuilder: (context, index) {
                        if (index < viewList.length) {
                          return CardBarang(
                              namaBarang: viewList[index]['namaBarang'],
                              idBarang: viewList[index]['id'],
                              jumlah: viewList[index]['jumlah'],
                              harga: viewList[index]['hargaAwal'],
                              kategori: viewList[index]['kategori'],
                              rekomendasi: viewList[index]['rekomendasiHarga'],
                              transaksi: transaksi);
                        } else {
                          return SizedBox(
                            height: 40,
                          );
                        }
                      });
                }
              }
            }),
          ),
          SizedBox(height: 23.0),
        ],
      ),
    ));
  }
}
