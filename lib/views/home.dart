import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:widuri/colors.dart';
import 'package:widuri/controller/c_barang.dart';
import 'package:widuri/controller/c_transaksi.dart';
import 'package:widuri/views/riwayat_transaksi.dart';

import '../gambar.dart';
import 'Widget/card_barang.dart';
import 'Widget/graphic.dart';
import 'Widget/notif_popup.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final auth = FirebaseAuth.instance;
  C_Barang barangController =
      C_Barang().initialized ? Get.find() : Get.put(C_Barang());
  C_Transaksi transaksiController =
      C_Transaksi().initialized ? Get.find() : Get.put(C_Transaksi());

  @override
  void initState() {
    transaksiController.updateDataGrafik();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var name = auth.currentUser!.displayName.obs;
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: Container(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Widuri',
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'RobotoMono',
                      color: backgroundColor),
                ),
                Card(
                  color: backgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: IconButton(
                    onPressed: () {
                      NotifBuildShowDialog(context);
                    },
                    icon: Icon(
                      Icons.notifications,
                      size: 20.0,
                      color: primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: primaryColor,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12))),
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Card(
                    color: backgroundColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Container(
                        width: w * 0.75,
                        decoration: BoxDecoration(),
                        margin: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: AssetImage(me),
                              maxRadius: 30.0,
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Text('Hai '),
                                    Obx(() => Text(
                                          '$name',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Text(
                                      ', Semangat yukk!!',
                                      overflow: TextOverflow.clip,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                SizedBox(
                                  width: w * 0.5,
                                  child: IntrinsicHeight(
                                      child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            child: Icon(Icons.history_rounded,
                                                size: 25),
                                            onTap: () {},
                                          ),
                                          Text('Transaksi')
                                        ],
                                      ),
                                      VerticalDivider(
                                        width: 3.0,
                                        color: Colors.black,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Hasil kamu hari ini'),
                                          Row(
                                            children: [
                                              Text('Rp '),
                                              Text('20000')
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  )),
                                )
                              ],
                            )
                          ],
                        )),
                  ),
                  Container(
                      margin: EdgeInsets.all(12),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Stock Barang Menipis',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'RobotoMono',
                            color: Colors.black),
                      )),
                  Obx(() {
                    if (barangController.barangList.isEmpty) {
                      return Center(
                          child: SpinKitFadingCube(
                        color: primaryColor,
                      ));
                    } else {
                      if (barangController.barangList[0] is int) {
                        return Center(
                          child: Text('Belum ada barang'),
                        );
                      } else {
                        var viewList = barangController.barangList
                            .where((value) => value['jumlah'] < 3)
                            .toList();
                        if (viewList.isEmpty) {
                          return Center(
                            child: Text("Belum ada barang menipis"),
                          );
                        } else {
                          return ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: viewList.length,
                              itemBuilder: (context, index) {
                                return CardBarang(
                                    namaBarang: viewList[index]['namaBarang'],
                                    idBarang: viewList[index]['id'],
                                    jumlah: viewList[index]['jumlah'],
                                    harga: viewList[index]['hargaAwal'],
                                    kategori: viewList[index]['kategori'],
                                    rekomendasi: viewList[index]
                                        ['rekomendasiHarga']);
                              });
                        }
                      }
                    }
                  }),
                  Container(
                      margin: EdgeInsets.all(12),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Tren Penjualan',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'RobotoMono',
                            color: Colors.black),
                      )),
                  AspectRatio(
                    aspectRatio: 1.5,
                    child: Card(
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      child: Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 12,
                          ),
                          SizedBox(
                            width: 150,
                            child: Obx(() {
                              return DropdownButtonFormField<String>(
                                value: barangController.valueDropdownHome.value,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                iconSize: 24,
                                elevation: 16,
                                style: TextStyle(color: Colors.black),
                                onChanged: (var newValue) {
                                  barangController.valueDropdownHome.value =
                                      newValue!;
                                  transaksiController.updateDataGrafik();
                                },
                                items: C_Barang.listDropdownHome
                                    .map((String item) =>
                                        DropdownMenuItem<String>(
                                            child: Text(item), value: item))
                                    .toList(),
                              );
                            }),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 16.0, left: 6.0),
                              child: grafik(),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
