import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:widuri/colors.dart';
import 'package:widuri/controller/c_transaksi.dart';
import 'package:widuri/views/Widget/card_riwayat.dart';

class RiwayatTransaksi extends StatefulWidget {
  const RiwayatTransaksi({Key? key}) : super(key: key);

  @override
  _RiwayatTransaksiState createState() => _RiwayatTransaksiState();
}

class _RiwayatTransaksiState extends State<RiwayatTransaksi> {
  TransaksiController transaksiController = Get.find();

  TextEditingController _search = TextEditingController(text: '');
  var args = Get.arguments;
  @override
  void dispose() {
    // TODO: implement dispose
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          title: Text(
            'Riwayat Transaksi',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Container(
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
                    controller: _search,
                    autofocus: false,
                    onChanged: (value) {
                      transaksiController.query.value =
                          _search.text.toLowerCase();
                    },
                    decoration: new InputDecoration(
                        hintText: 'Search', border: InputBorder.none),
                    // onChanged: onSearchTextChanged,
                  ),
                ),
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(12),
                  child: Text(
                    'Daftar Transaksi',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'RobotoMono',
                        color: Colors.black),
                  )),
              Expanded(
                child: Obx(() {
                  if (transaksiController.listTransaksi.isEmpty) {
                    return Center(
                        child: SpinKitFadingCube(
                      color: primaryColor,
                    ));
                  } else {
                    var viewList = [];
                    if (transaksiController.query.value == '') {
                      viewList = transaksiController.listTransaksi;
                    } else {
                      if (!(transaksiController.listTransaksi.value[0]
                          is int)) {
                        if (transaksiController.listTransaksi
                            .where((value) => value.values.first['caseSearch']
                                .contains(transaksiController.query.value))
                            .toList()
                            .isEmpty) {
                          return Text('Transaksi tidak ditemukan');
                        } else {
                          viewList = transaksiController.listTransaksi
                              .where((value) => value.values.first['caseSearch']
                                  .contains(transaksiController.query.value))
                              .toList();
                        }
                      } else {
                        return Text('Transaksi tidak ditemukan');
                      }
                    }
                    if (viewList[0] is int) {
                      return Text('Transaksi tidak ditemukan');
                    } else {
                      if (args != null) {
                        viewList = viewList
                            .where((element) =>
                                element.values.first['penjual'] ==
                                transaksiController
                                    .auth.currentUser!.displayName
                                    .toString())
                            .toList();
                        if (viewList.isEmpty) {
                          return Text('Transaksi tidak ditemukan');
                        }
                      }
                      return ListView.builder(
                          itemCount: viewList.length,
                          itemBuilder: (context, index) {
                            return CardRiwayat(
                                id: viewList[index].keys.first,
                                namaPenjual:
                                    viewList[index].values.first['penjual'],
                                tanggal:
                                    viewList[index].values.first['tanggal'],
                                laba: viewList[index].values.first['laba'],
                                hargaDeal:
                                    viewList[index].values.first['hargaDeal'],
                                listBarang: viewList[index]
                                    .values
                                    .first['barang']
                                    .values
                                    .toList());
                          });
                    }
                  }
                }),
              ),
              SizedBox(height: 23.0),
            ],
          ),
        )));
  }
}
