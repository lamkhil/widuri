import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../colors.dart';

class TambahTransaksi extends StatefulWidget {
  const TambahTransaksi({Key? key}) : super(key: key);

  @override
  _TambahTransaksiState createState() => _TambahTransaksiState();
}

class _TambahTransaksiState extends State<TambahTransaksi> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Container(

          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Tambah Transaksi',
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

      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Column(
              children: [Card(
                  elevation: 4,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Harga deal',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'RobotoMono',
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)),
                                      primary: primaryColor),
                                  onPressed: () {},
                                  child: Text('+100000')),
                              SizedBox(
                                width: w * 0.01,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)),
                                      primary: primaryColor),
                                  onPressed: () {},
                                  child: Text('+100000')),
                              SizedBox(
                                width: w * 0.01,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)),
                                      primary: primaryColor),
                                  onPressed: () {},
                                  child: Text('+100000')),
                              SizedBox(
                                width: w * 0.01,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)),
                                      primary: primaryColor),
                                  onPressed: () {},
                                  child: Text('+100000')),
                              SizedBox(
                                width: w * 0.01,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)),
                                      primary: primaryColor),
                                  onPressed: () {},
                                  child: Text('+100000')),
                              SizedBox(
                                width: w * 0.01,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)),
                                      primary: primaryColor),
                                  onPressed: () {},
                                  child: Text('+100000')),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: primaryColor,
                                width: 1.0,
                              )),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            decoration: InputDecoration(
                              hintText: "contoh: 100.000",
                              border: InputBorder.none,
                              suffixText: "Rupiah",
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 8,
                        ),

                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: primaryColor,
                                width: 1.0,
                              )),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            decoration: InputDecoration(
                              hintText: "contoh: 100.000",
                              border: InputBorder.none,
                              suffixText: "Rupiah",
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 8,
                        ),

                        Text(
                          'Catatan',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'RobotoMono',
                              color: Colors.black),
                        ),

                        SizedBox(
                          height: 8,
                        ),

                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          height: 72,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: primaryColor,
                                width: 1.0,
                              )),
                          child: TextFormField(
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              hintText: "contoh : Ini merupakan transaksi lama dari ibu sumiati yang ngutang dan sekarang baru dibayar.",
                              hintMaxLines: 3,
                              border: InputBorder.none,
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 6,
                        ),

                        Text(
                          'Batas teks 100 karakter',
                          style: TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'RobotoMono',
                              color: Colors.black),
                        ),
                      ],
                    ),
                  )
              ),

                SizedBox(
                  height: 23,
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ' Detail Barang',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'RobotoMono',
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Card(
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
                                      Container(
                                        constraints: BoxConstraints(maxWidth: w * 0.2),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            FittedBox(
                                              child: Text(
                                                "seet",
                                              ),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              "tea",
                                              style: TextStyle(
                                                  fontSize: 10.0,
                                                  fontWeight: FontWeight.w200),
                                            )
                                          ],
                                        ),
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
                                              'Jumlah',
                                              style: TextStyle(
                                                  fontSize: 14.0, color: primaryColor),
                                            ),
                                            SizedBox(
                                              height: 4.0,
                                            ),
                                            Container(
                                              constraints: BoxConstraints(minWidth: 16.0),
                                              child: Text(
                                                "tess",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                            ),
                                          ]),
                                      SizedBox(
                                        width: 23.0,
                                      ),
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
                                            Container(
                                              constraints: BoxConstraints(minWidth: 16.0),
                                              child: Text(
                                                "tess",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                            ),
                                          ]),
                                      SizedBox(
                                        width: 23.0,
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          FittedBox(
                                            fit: BoxFit.contain,
                                            child: Text(
                                              'Harga Awal',
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                color: primaryColor,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 4.0,
                                          ),
                                          Text('Rp. tes',
                                              style: TextStyle(
                                                fontSize: 14.0,
                                              )),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ))),
                  ],
                )
              ],
            )
        ),
      )
    );
  }
}
