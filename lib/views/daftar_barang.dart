import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:widuri/colors.dart';
import 'package:widuri/controller/c_barang.dart';
import 'Widget/alert_dialog.dart';
import 'Widget/card_barang.dart';
import 'package:get/get.dart';

class DaftarBarang extends StatefulWidget {
  const DaftarBarang({Key? key}) : super(key: key);

  @override
  _DaftarBarangState createState() => _DaftarBarangState();
}

class _DaftarBarangState extends State<DaftarBarang>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  final k = TextEditingController();
  final n = TextEditingController();
  final hA = TextEditingController();
  final rH = TextEditingController();
  final jmlh = C_Barang();
  final barangController = Get.put(C_Barang());

  @override
  void initState() {
    controller = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    k.dispose();
    n.dispose();
    hA.dispose();
    rH.dispose();
    jmlh.dispose();
    barangController.dispose();
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
            onPressed: () {
              popUpTambahBarang();
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
                FlatButton(
                  padding: EdgeInsets.all(6.0),
                  child: Icon(
                    Icons.notifications,
                    color: Colors.black38,
                  ),
                  color: Colors.white,
                  height: 40,
                  minWidth: 40,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
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
                    'Stock Barang',
                    style: TextStyle(
                        fontSize: 18.0,
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
                      viewList = barangController.barangList
                          .where((value) => value['caseSearch']
                              .contains(barangController.query.value))
                          .toList();
                      if (viewList.isEmpty) {
                        return Text('Belum ada barang');
                      }
                    }
                    if (viewList[0] is int) {
                      return Text('Belum ada barang');
                    } else {
                      return ListView.builder(
                          itemCount: viewList.length,
                          itemBuilder: (context, index) {
                            return CardBarang(
                                namaBarang: viewList[index]['namaBarang'],
                                idBarang: viewList[index]['id'],
                                jumlah: viewList[index]['jumlah'],
                                harga: viewList[index]['hargaAwal']);
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

  void popUpTambahBarang() {
    final _formKey = GlobalKey<FormState>();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          var w = MediaQuery.of(context).size.width;
          var h = MediaQuery.of(context).size.height;
          return AlertDialog(
              scrollable: true,
              title: Text(
                'Tambah Barang',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              content: Obx(() {
                if (C_Barang.isLoadingStatic.value) {
                  return SpinKitFadingCube(
                    color: primaryColor,
                  );
                } else {
                  return Container(
                    width: w - 23,
                    child: Form(
                      key: _formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Kategori',
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 6.0,
                            ),
                            Container(
                              constraints: BoxConstraints(maxWidth: w * 1),
                              child: Card(
                                margin: EdgeInsets.zero,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    right: 10.0,
                                    left: 10.0,
                                  ),
                                  child: new TextFormField(
                                    validator: (value) {
                                      if (value == '') {
                                        return 'Jangan Dikosongi';
                                      }
                                      return null;
                                    },
                                    controller: k,
                                    decoration: new InputDecoration(
                                        hintText: 'contoh : Baju',
                                        focusColor: primaryColor,
                                        hintStyle: TextStyle(
                                            fontWeight: FontWeight.w300),
                                        focusedBorder: new OutlineInputBorder(
                                            borderRadius:
                                                const BorderRadius.all(
                                              const Radius.circular(12.0),
                                            ),
                                            borderSide: BorderSide(
                                                color: primaryColor,
                                                width: 2.0)),
                                        border: new OutlineInputBorder(
                                            borderRadius:
                                                const BorderRadius.all(
                                              const Radius.circular(12.0),
                                            ),
                                            borderSide: BorderSide(
                                                color: primaryColor,
                                                width: 2.0)),
                                        contentPadding:
                                            new EdgeInsets.symmetric(
                                                horizontal: 10.0)),
                                    // onChanged: onSearchTextChanged,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 23.0,
                            ),
                            Text(
                              'Nama',
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 6.0,
                            ),
                            Container(
                              constraints: BoxConstraints(maxWidth: w * 1),
                              child: Card(
                                margin: EdgeInsets.zero,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    right: 10.0,
                                    left: 10.0,
                                  ),
                                  child: new TextFormField(
                                    validator: (value) {
                                      if (value == '') {
                                        return 'Jangan Dikosongi';
                                      }
                                      return null;
                                    },
                                    controller: n,
                                    decoration: new InputDecoration(
                                        hintText: 'contoh : Baju Gamis L21',
                                        hintStyle: TextStyle(
                                            fontWeight: FontWeight.w300),
                                        focusedBorder: new OutlineInputBorder(
                                            borderRadius:
                                                const BorderRadius.all(
                                              const Radius.circular(12.0),
                                            ),
                                            borderSide: BorderSide(
                                                color: primaryColor,
                                                width: 2.0)),
                                        border: new OutlineInputBorder(
                                            borderRadius:
                                                const BorderRadius.all(
                                              const Radius.circular(12.0),
                                            ),
                                            borderSide: BorderSide(
                                                color: primaryColor,
                                                width: 2.0)),
                                        contentPadding:
                                            new EdgeInsets.symmetric(
                                                horizontal: 10.0)),
                                    // onChanged: onSearchTextChanged,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 23.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Harga Awal',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'RobotoMono'),
                                    ),
                                    SizedBox(
                                      height: 6.0,
                                    ),
                                    Container(
                                      constraints:
                                          BoxConstraints(maxWidth: w * 0.335),
                                      child: Card(
                                        margin: EdgeInsets.zero,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            right: 10.0,
                                            left: 10.0,
                                          ),
                                          child: new TextFormField(
                                            validator: (value) {
                                              if (value == '') {
                                                return 'Jangan Dikosongi';
                                              }
                                              return null;
                                            },
                                            controller: hA,
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              WhitelistingTextInputFormatter
                                                  .digitsOnly,
                                            ],
                                            decoration: new InputDecoration(
                                                hintText: 'contoh : 13000',
                                                hintStyle: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w300),
                                                focusedBorder:
                                                    new OutlineInputBorder(
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                          const Radius.circular(
                                                              12.0),
                                                        ),
                                                        borderSide: BorderSide(
                                                            color: primaryColor,
                                                            width: 2.0)),
                                                border: new OutlineInputBorder(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      const Radius.circular(
                                                          12.0),
                                                    ),
                                                    borderSide: BorderSide(
                                                        color: primaryColor,
                                                        width: 2.0)),
                                                contentPadding:
                                                    new EdgeInsets.symmetric(
                                                        horizontal: 10.0)),
                                            // onChanged: onSearchTextChanged,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Rekomendasi Harga',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'RobotoMono'),
                                    ),
                                    SizedBox(
                                      height: 6.0,
                                    ),
                                    Container(
                                      constraints:
                                          BoxConstraints(maxWidth: w * 0.335),
                                      child: Card(
                                        margin: EdgeInsets.zero,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            right: 10.0,
                                            left: 10.0,
                                          ),
                                          child: new TextFormField(
                                            validator: (value) {
                                              if (value == '') {
                                                return 'Jangan Dikosongi';
                                              }
                                              return null;
                                            },
                                            controller: rH,
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              WhitelistingTextInputFormatter
                                                  .digitsOnly,
                                            ],
                                            decoration: new InputDecoration(
                                                hintText: 'contoh : 13000',
                                                hintStyle: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w300),
                                                focusedBorder:
                                                    new OutlineInputBorder(
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                          const Radius.circular(
                                                              12.0),
                                                        ),
                                                        borderSide: BorderSide(
                                                            color: primaryColor,
                                                            width: 2.0)),
                                                border: new OutlineInputBorder(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      const Radius.circular(
                                                          12.0),
                                                    ),
                                                    borderSide: BorderSide(
                                                        color: primaryColor,
                                                        width: 2.0)),
                                                contentPadding:
                                                    new EdgeInsets.symmetric(
                                                        horizontal: 10.0)),
                                            // onChanged: onSearchTextChanged,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 23.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  constraints: BoxConstraints(
                                      maxWidth: w * 0.35, minHeight: h * 0.09),
                                  child: Card(
                                    elevation: 4.0,
                                    margin: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            'Jumlah',
                                            style: TextStyle(
                                                color: primaryColor,
                                                fontSize: 10),
                                          ),
                                          SizedBox(
                                            height: 4.0,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              IconButton(
                                                  padding: EdgeInsets.zero,
                                                  constraints: BoxConstraints(),
                                                  onPressed: () {
                                                    jmlh.kurangJumlahBarang();
                                                  },
                                                  icon: Icon(
                                                    Icons.remove_circle_rounded,
                                                    color: primaryColor,
                                                  )),
                                              SizedBox(
                                                width: 6.0,
                                              ),
                                              Expanded(
                                                  child: Obx(
                                                () => FocusScope(
                                                  onFocusChange: (value) {
                                                    String result = jmlh
                                                        .textController
                                                        .value
                                                        .text
                                                        .toString();
                                                    if (value) {
                                                      if (result == '0') {
                                                        jmlh.textController
                                                            .value.text = '';
                                                      }
                                                    } else {
                                                      if (result == '' ||
                                                          result == '0') {
                                                        jmlh.textController
                                                            .value.text = '1';
                                                      } else {
                                                        var i =
                                                            int.parse(result);
                                                        if (i > 0) {
                                                          jmlh.textController
                                                                  .value.text =
                                                              i.toString();
                                                        } else {
                                                          jmlh.textController
                                                              .value.text = '1';
                                                        }
                                                      }
                                                    }
                                                  },
                                                  child: TextFormField(
                                                    textAlign: TextAlign.center,
                                                    controller: jmlh
                                                        .textController.value,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    inputFormatters: [
                                                      FilteringTextInputFormatter
                                                          .digitsOnly
                                                    ],
                                                    decoration: InputDecoration(
                                                        border:
                                                            InputBorder.none),
                                                  ),
                                                ),
                                              )),
                                              SizedBox(
                                                width: 6.0,
                                              ),
                                              IconButton(
                                                  padding: EdgeInsets.zero,
                                                  constraints: BoxConstraints(),
                                                  onPressed: () {
                                                    jmlh.tambahJumlahBarang();
                                                  },
                                                  icon: Icon(
                                                    Icons.add_circle_rounded,
                                                    color: primaryColor,
                                                  ))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ]),
                    ),
                  );
                }
              }),
              actions: [
                Obx(() {
                  if (C_Barang.isLoadingStatic.value) {
                    return Container();
                  } else {
                    return Container(
                      margin: EdgeInsets.all(13.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0)),
                            primary: primaryColor,
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              var kategori = k.text;
                              var nama = n.text;
                              var hargaAwal = hA.text;
                              var rekomHarga = rH.text;
                              var j = jmlh.textController.value.text.toString();
                              k.text = '';
                              n.text = '';
                              hA.text = '';
                              rH.text = '';
                              jmlh.textController.value.text = '1';
                              await C_Barang.tambahBarang(
                                  context,
                                  kategori,
                                  nama,
                                  int.parse(hargaAwal),
                                  int.parse(rekomHarga),
                                  int.parse(j));
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              'Simpan Barang',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    );
                  }
                })
              ]);
        });
  }
}
