import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:widuri/colors.dart';
import 'Widget/card_barang.dart';

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
                  child: Icon(
                    Icons.notifications,
                    color: Colors.black38,
                  ),
                  color: Colors.white,
                  height: 40,
                  minWidth: 40,
                  shape: CircleBorder(),
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
              Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        CardBarang(
                          namaBarang: 'Hijab Segitiga',
                          idBarang: 'Hij-001',
                          jumlah: 5,
                          harga: 10000,
                        ),
                        SizedBox(height: 12.0),
                        CardBarang(
                          namaBarang: 'Hijab kotak',
                          idBarang: 'Hij-002',
                          jumlah: 5,
                          harga: 10000,
                        ),
                        SizedBox(height: 12.0),
                        CardBarang(
                          namaBarang: 'Hijab Langsung',
                          idBarang: 'Hij-003',
                          jumlah: 10,
                          harga: 15000,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 23.0),
            ],
          ),
        )));
  }

  void popUpTambahBarang() {
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
            content: Container(
              width: w - 23,
              child: Form(
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
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              side: BorderSide(color: primaryColor)),
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: 10.0,
                              left: 10.0,
                            ),
                            child: new TextField(

                              decoration: new InputDecoration(
                                  hintText: 'contoh : Baju',
                                  hintStyle:
                                      TextStyle(fontWeight: FontWeight.w300),
                                  border: InputBorder.none),
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
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              side: BorderSide(color: primaryColor)),
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: 10.0,
                              left: 10.0,
                            ),
                            child: new TextField(
                              decoration: new InputDecoration(
                                  hintText: 'contoh : Baju Gamis L21',
                                  hintStyle:
                                      TextStyle(fontWeight: FontWeight.w300),
                                  border: InputBorder.none),
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
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      side: BorderSide(color: primaryColor)),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      right: 10.0,
                                      left: 10.0,
                                    ),
                                    child: new TextField(
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        WhitelistingTextInputFormatter.digitsOnly,
                                      ],
                                      decoration: new InputDecoration(

                                          hintText: 'contoh : 13000',
                                          hintStyle: TextStyle(
                                              fontWeight: FontWeight.w300),
                                          border: InputBorder.none),
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
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      side: BorderSide(color: primaryColor)),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      right: 10.0,
                                      left: 10.0,
                                    ),
                                    child: new TextField(
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        WhitelistingTextInputFormatter.digitsOnly,
                                      ],
                                      decoration: new InputDecoration(
                                          hintText: 'contoh : 13000',
                                          hintStyle: TextStyle(
                                              fontWeight: FontWeight.w300),
                                          border: InputBorder.none),
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
                      Container(
                        padding: EdgeInsets.all(6),
                        constraints: BoxConstraints(
                            maxWidth: w * 0.2, maxHeight: h * 0.1),
                        child: Card(
                          margin: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Jumlah',
                                style: TextStyle(
                                    color: primaryColor, fontSize: 10),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.add_circle_rounded,
                                        color: primaryColor,
                                      )),
                                  Text(
                                    '2',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  IconButton(
                                      onPressed: () {},
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
                    ]),
              ),
            ),
            actions: [
              Container(
                margin: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0 ),
                  ),
                  child : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: primaryColor,
                        padding: EdgeInsets.all(12.0),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Simpan Barang",
                      style: TextStyle(
                          fontFamily: 'RobotoMono',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )
              ),

            ],
          );
        });
  }
}
