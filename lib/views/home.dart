import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:widuri/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:widuri/controller/c_barang.dart';
import 'package:widuri/controller/c_transaksi.dart';
import 'Widget/card_barang.dart';
import 'Widget/graphic.dart';

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
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    var name = auth.currentUser!.displayName == null
        ? ''
        : auth.currentUser!.displayName;
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: Container(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Hi $name',
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'RobotoMono',
                      color: Colors.black),
                ),
                Card(
                  color: backgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: IconButton(
                    onPressed: () {
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
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: ListView(
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              child: new ListTile(
                leading: new Icon(Icons.search),
                title: new TextField(
                  decoration: new InputDecoration(
                      hintText: 'Search', border: InputBorder.none),
                  // onChanged: onSearchTextChanged,
                ),
                trailing: new IconButton(
                  icon: new Icon(Icons.filter_list_rounded),
                  onPressed: () {},
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.all(12),
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
                              rekomendasi: viewList[index]['rekomendasiHarga']);
                        });
                  }
                }
              }
            }),
            Container(
                margin: EdgeInsets.all(12),
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
                              .map((String item) => DropdownMenuItem<String>(
                                  child: Text(item), value: item))
                              .toList(),
                        );
                      }),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16.0, left: 6.0),
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
        ));
  }
}
