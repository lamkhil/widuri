import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:widuri/controller/c_transaksi.dart';
import 'package:intl/intl.dart';
import 'package:widuri/views/Widget/tambah_barang_transaksi.dart';
import '../colors.dart';

class TambahTransaksi extends StatefulWidget {
  const TambahTransaksi({Key? key}) : super(key: key);

  @override
  _TambahTransaksiState createState() => _TambahTransaksiState();
}

class _TambahTransaksiState extends State<TambahTransaksi> {

  var transaksiController = Get.put(C_Transaksi());

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
                      fontSize: 24.0,
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
                children: [
                  Card(
                      color: backgroundColor,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Harga deal',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'RobotoMono',
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                           SingleChildScrollView(
                             scrollDirection: Axis.horizontal,
                             child: Row(
                               children: [
                                 SizedBox(
                                   height: h * 0.05,
                                   width: w * 0.15,
                                   child: ElevatedButton(
                                     onPressed: () {},
                                     style: ElevatedButton.styleFrom(
                                         primary: primaryColor,
                                         shape: RoundedRectangleBorder(
                                             borderRadius:
                                             BorderRadius.circular(10.0))),
                                     child: Text(
                                       '+1000',
                                       style: TextStyle(
                                           fontWeight: FontWeight.bold,
                                           fontFamily: 'Roboto',
                                           fontSize: 13.0),
                                     ),
                                   ),
                                 ),
                                 SizedBox(
                                   width: 5.0,
                                 ),
                                 SizedBox(
                                   height: h * 0.05,
                                   width: w * 0.15,
                                   child: ElevatedButton(
                                     onPressed: () {},
                                     style: ElevatedButton.styleFrom(
                                         primary: primaryColor,
                                         shape: RoundedRectangleBorder(
                                             borderRadius:
                                             BorderRadius.circular(10.0))),
                                     child: Text(
                                       '+2000',
                                       style: TextStyle(
                                           fontWeight: FontWeight.bold,
                                           fontFamily: 'Roboto',
                                           fontSize: 13.0),
                                     ),
                                   ),
                                 ),
                                 SizedBox(
                                   width: 5.0,
                                 ),
                                 SizedBox(
                                   height: h * 0.05,
                                   width: w * 0.15,
                                   child: ElevatedButton(
                                     onPressed: () {},
                                     style: ElevatedButton.styleFrom(
                                         primary: primaryColor,
                                         shape: RoundedRectangleBorder(
                                             borderRadius:
                                             BorderRadius.circular(10.0))),
                                     child: Text(
                                       '+5000',
                                       style: TextStyle(
                                           fontWeight: FontWeight.bold,
                                           fontFamily: 'Roboto',
                                           fontSize: 13.0),
                                     ),
                                   ),
                                 ),
                                 SizedBox(
                                   width: 5.0,
                                 ),
                                 SizedBox(
                                   height: h * 0.05,
                                   width: w * 0.15,
                                   child: ElevatedButton(
                                     onPressed: () {},
                                     style: ElevatedButton.styleFrom(
                                         primary: primaryColor,
                                         shape: RoundedRectangleBorder(
                                             borderRadius:
                                             BorderRadius.circular(10.0))),
                                     child: Text(
                                       '+10.000',
                                       style: TextStyle(
                                           fontWeight: FontWeight.bold,
                                           fontFamily: 'Roboto',
                                           fontSize: 13.0),
                                     ),
                                   ),
                                 ),
                                 SizedBox(
                                   width: 5.0,
                                 ),
                                 SizedBox(
                                   height: h * 0.05,
                                   width: w * 0.15,
                                   child: ElevatedButton(
                                     onPressed: () {},
                                     style: ElevatedButton.styleFrom(
                                         primary: primaryColor,
                                         shape: RoundedRectangleBorder(
                                             borderRadius:
                                             BorderRadius.circular(10.0))),
                                     child: Text(
                                       '+20.000',
                                       style: TextStyle(
                                           fontWeight: FontWeight.bold,
                                           fontFamily: 'Roboto',
                                           fontSize: 13.0),
                                     ),
                                   ),
                                 ),
                                 SizedBox(
                                   width: 5.0,
                                 ),
                                 SizedBox(
                                   height: h * 0.05,
                                   width: w * 0.15,
                                   child: ElevatedButton(
                                     onPressed: () {},
                                     style: ElevatedButton.styleFrom(
                                         primary: primaryColor,
                                         shape: RoundedRectangleBorder(
                                             borderRadius:
                                             BorderRadius.circular(10.0))),
                                     child: Text(
                                       '+50.000',
                                       style: TextStyle(
                                           fontWeight: FontWeight.bold,
                                           fontFamily: 'Roboto',
                                           fontSize: 13.0),
                                     ),
                                   ),
                                 ),
                                 SizedBox(
                                   width: 5.0,
                                 ),
                                 SizedBox(
                                   height: h * 0.05,
                                   width: w * 0.15,
                                   child: ElevatedButton(
                                     onPressed: () {},
                                     style: ElevatedButton.styleFrom(
                                         primary: primaryColor,
                                         shape: RoundedRectangleBorder(
                                             borderRadius:
                                             BorderRadius.circular(10.0))),
                                     child: Text(
                                       '+100.000',
                                       style: TextStyle(
                                           fontWeight: FontWeight.bold,
                                           fontFamily: 'Roboto',
                                           fontSize: 13.0),
                                     ),
                                   ),
                                 ),
                                 SizedBox(
                                   width: 5.0,
                                 ),
                               ],
                             ),
                           ),
                            SizedBox(
                              height: 20,
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
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: InputDecoration(
                                  hintText: "contoh: 100.000",
                                  hintStyle: TextStyle(fontWeight: FontWeight.w300,
                                      fontFamily: 'Roboto',
                                      fontSize: 13.0),
                                  border: InputBorder.none,
                                  suffixText: "Rupiah",
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: h * 0.05,
                                padding: EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: primaryColor,
                                      width: 1.0,
                                    )),
                                child: Obx(() {
                                  var date = DateTime.now();

                                  if (transaksiController.date.value == '') {
                                    transaksiController.date.value =
                                        DateFormat('dd-MM-yyyy').format(date);
                                  }
                                  return ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0, primary: backgroundColor),
                                    onPressed: () async {
                                      DateTime selectedDate = date;
                                      final DateTime? picked =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: selectedDate,
                                        firstDate: DateTime(1975),
                                        lastDate: DateTime(2050),
                                        // selectableDayPredicate: (DateTime val) =>
                                        //     val.weekday == 6 || val.weekday == 7 ? true : false,
                                      );
                                      if (picked != null) {
                                        transaksiController.date.value =
                                            DateFormat('dd-MM-yyyy')
                                                .format(picked);
                                      }
                                    },
                                    icon: Icon(
                                      Icons.date_range,
                                      color: primaryColor,
                                    ),
                                    label: Text(
                                      transaksiController.date.value,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  );
                                })),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Catatan',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'RobotoMono',
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                height: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: primaryColor,
                                      width: 1.0,
                                    )),
                                child: TextFormField(
                                  controller: transaksiController
                                      .controllerCatatan.value,
                                  keyboardType: TextInputType.multiline,
                                  maxLength: 100,
                                  maxLines: null,
                                  onChanged: (value) {
                                    transaksiController.catatan.value = value;
                                  },
                                  decoration: InputDecoration(
                                    counterText: '',
                                    hintText:
                                        "contoh : Ini merupakan transaksi lama dari ibu sumiati yang ngutang dan sekarang baru dibayar.",
                                    hintStyle: TextStyle(fontWeight: FontWeight.w300,
                                        fontFamily: 'Roboto',
                                        fontSize: 13.0),
                                    hintMaxLines: 3,
                                    border: InputBorder.none,
                                  ),
                                )),
                            SizedBox(
                              height: 6,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Obx(
                                  () => Text(
                                    '${transaksiController.catatan.value.length.toString()}/100',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontFamily: 'RobotoMono',
                                        color: Colors.black),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Detail Barang',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'RobotoMono',
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: SizedBox(
                                height: 40,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                          constraints:
                                              BoxConstraints(maxWidth: w * 0.2),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                                    fontWeight:
                                                        FontWeight.w200),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                'Jumlah',
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: primaryColor),
                                              ),
                                              SizedBox(
                                                height: 4.0,
                                              ),
                                              Container(
                                                constraints: BoxConstraints(
                                                    minWidth: 16.0),
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                'Stock',
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: primaryColor),
                                              ),
                                              SizedBox(
                                                height: 4.0,
                                              ),
                                              Container(
                                                constraints: BoxConstraints(
                                                    minWidth: 16.0),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                      SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                        height: h * 0.05,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              primary: primaryColor),
                          onPressed: () {
                            Get.to(TambahBarangTransaksi());
                          },
                          icon: Icon(
                            Icons.add_circle_rounded,
                          ),
                          label: Text("Tambah Barang", style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Roboto',
                              fontSize: 14.0),),
                        ),
                      ),

                      SizedBox(height: 35),
                      SizedBox(
                        height: h * 0.05,
                        width: w,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              primary: primaryColor),
                          onPressed: () {
                          },
                          child: Text("Simpan Barang", style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Roboto',
                            fontSize: 16.0,
                          )),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      )
                    ],
                  )
                ],
              )),
        ));
  }
}
