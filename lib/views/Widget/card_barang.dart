import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:widuri/colors.dart';

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
    var w = MediaQuery.of(context).size.width;
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
                        Container(
                          constraints: BoxConstraints(maxWidth: w * 0.2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              FittedBox(
                                child: Text(
                                  namaBarang,
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                idBarang,
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
                                  '$jumlah',
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
                            Text('Rp. $harga',
                                style: TextStyle(
                                  fontSize: 14.0,
                                )),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_forward_ios_rounded),
                          iconSize: 16.0,
                        )
                      ],
                    )
                  ],
                ),
              ))),
    );
  }
}
