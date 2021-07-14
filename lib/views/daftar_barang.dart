import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:widuri/colors.dart';
import './stockbarang.dart' as stock;
import './barangmenipis.dart' as barangMenipis;

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
            onPressed: () {},
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
              new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Daftar Barang',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'RobotoMono',
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text('|'),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Daftar Barang Menipis',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'RobotoMono',
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
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
}

class CardBarang extends StatelessWidget {
  CardBarang(
      {required this.namaBarang,
      required this.idBarang,
      required this.jumlah,
      required this.harga});

  String namaBarang;
  String idBarang;
  int jumlah;
  int harga;

  @override
  Widget build(BuildContext context) {
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
                          CupertinoIcons.cube_box_fill,
                          color: Colors.amber,
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              namaBarang,
                              style: TextStyle(fontSize: 16.0),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              idBarang,
                              style: TextStyle(
                                  fontSize: 10.0, fontWeight: FontWeight.w200),
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Stock',
                              style: TextStyle(
                                  fontSize: 14.0, color: primaryColor),
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    constraints: BoxConstraints(),
                                    onPressed: () {},
                                    icon:
                                        Icon(CupertinoIcons.minus_circle_fill),
                                    color: primaryColor,
                                    iconSize: 20,
                                  ),
                                  SizedBox(
                                    width: 12.0,
                                  ),
                                  Container(
                                    constraints: BoxConstraints(minWidth: 16.0),
                                    child: Text(
                                      '$jumlah',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12.0,
                                  ),
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    constraints: BoxConstraints(),
                                    onPressed: () {},
                                    icon: Icon(CupertinoIcons.plus_circle_fill),
                                    color: primaryColor,
                                    iconSize: 20,
                                  ),
                                ])
                          ],
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Harga Awal',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Text('Rp. $harga',
                                style: TextStyle(
                                  fontSize: 14.0,
                                )),
                          ],
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_forward_ios_rounded))
                      ],
                    )
                  ],
                ),
              ))),
    );
  }
}
