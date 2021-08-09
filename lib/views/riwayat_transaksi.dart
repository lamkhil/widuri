import 'package:flutter/material.dart';
import 'package:widuri/colors.dart';
import 'package:widuri/views/Widget/card_riwayat.dart';

class RiwayatTransaksi extends StatefulWidget {
  const RiwayatTransaksi({Key? key}) : super(key: key);

  @override
  _RiwayatTransaksiState createState() => _RiwayatTransaksiState();
}

class _RiwayatTransaksiState extends State<RiwayatTransaksi> {
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
                    autofocus: false,
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
                    'Daftar Barang',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'RobotoMono',
                        color: Colors.black),
                  )),
              Expanded(
                  child: ListView.builder(
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        if (index < 6) {
                          return CardRiwayat(
                            namaPenjual: "Lamkhilus",
                            harga: 100000,
                            tanggal: "27-Sept-2021",
                            listBarang: [1, 2, 3],
                          );
                        } else {
                          return SizedBox(
                            height: 40,
                          );
                        }
                      })),
              SizedBox(height: 23.0),
            ],
          ),
        )));
  }
}
