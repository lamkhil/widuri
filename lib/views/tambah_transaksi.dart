import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:widuri/controller/c_transaksi.dart';
import 'package:intl/intl.dart';
import 'package:widuri/views/Widget/card_barang.dart';
import 'package:widuri/views/Widget/loader_dialog.dart';
import 'package:widuri/views/Widget/tambah_barang_transaksi.dart';
import '../colors.dart';

class TambahTransaksi extends StatefulWidget {
  const TambahTransaksi({Key? key}) : super(key: key);

  @override
  _TambahTransaksiState createState() => _TambahTransaksiState();
}

class _TambahTransaksiState extends State<TambahTransaksi> {
  var transaksiController = Get.put(C_Transaksi());

  var listHelperHarga = [500, 1000, 2000, 5000, 10000, 20000, 50000, 100000];

  var dateFormat = 'dd/MM/yyyy';

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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Harga deal',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'RobotoMono',
                                      color: Colors.black),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.remove_circle_rounded,
                                      color: primaryColor,
                                    ),
                                    Obx(
                                      () => Switch(
                                          value: transaksiController
                                              .isTambah.value,
                                          inactiveThumbColor: primaryColor,
                                          inactiveTrackColor:
                                              primaryColorSwatch[50],
                                          onChanged: (value) {
                                            transaksiController.isTambah.value =
                                                value;
                                          }),
                                    ),
                                    Icon(
                                      Icons.add_circle_rounded,
                                      color: primaryColor,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 40,
                              child: Obx(() {
                                String tanda =
                                    transaksiController.isTambah.value == true
                                        ? "+"
                                        : "-";
                                return ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: listHelperHarga.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      height: 40,
                                      width: w * 0.175,
                                      margin: EdgeInsets.only(left: 6),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (transaksiController
                                              .isTambah.value) {
                                            if (transaksiController
                                                    .controllerHarga
                                                    .value
                                                    .text ==
                                                '') {
                                              transaksiController
                                                      .controllerHarga
                                                      .value
                                                      .text =
                                                  listHelperHarga[index]
                                                      .toString();
                                            } else {
                                              var temp = int.parse(
                                                  transaksiController
                                                      .controllerHarga
                                                      .value
                                                      .text);
                                              transaksiController
                                                  .controllerHarga
                                                  .value
                                                  .text = (temp +
                                                      listHelperHarga[index])
                                                  .toString();
                                            }
                                          } else if (transaksiController
                                                  .controllerHarga.value.text !=
                                              "") {
                                            var temp = int.parse(
                                                transaksiController
                                                    .controllerHarga
                                                    .value
                                                    .text);
                                            transaksiController.controllerHarga
                                                    .value.text =
                                                (temp - listHelperHarga[index])
                                                    .toString();
                                          }
                                          transaksiController.controllerHarga
                                              .refresh();
                                        },
                                        style: ElevatedButton.styleFrom(
                                            primary: primaryColor,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0))),
                                        child: FittedBox(
                                          child: Text(
                                            "$tanda${listHelperHarga[index]}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Roboto',
                                                fontSize: 13.0),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }),
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
                              child: Obx(
                                () => TextFormField(
                                  controller:
                                      transaksiController.controllerHarga.value,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    transaksiController.controllerHarga
                                        .refresh();
                                  },
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    hintText: "contoh: 100.000",
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontFamily: 'Roboto',
                                        fontSize: 13.0),
                                    border: InputBorder.none,
                                    suffixText: "Rupiah",
                                  ),
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
                                        DateFormat(dateFormat).format(date);
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
                                            DateFormat(dateFormat)
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
                                child: Obx(
                                  () => TextFormField(
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
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontFamily: 'Roboto',
                                          fontSize: 13.0),
                                      hintMaxLines: 3,
                                      border: InputBorder.none,
                                    ),
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
                      Obx(
                        () {
                          return ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: transaksiController.barang.values
                                  .toList()
                                  .length,
                              itemBuilder: (context, index) {
                                return CardBarang(
                                  namaBarang: transaksiController.barang.values
                                      .toList()[index]['namaBarang'],
                                  idBarang: transaksiController.barang.values
                                      .toList()[index]['id'],
                                  jumlah: transaksiController.barang.values
                                      .toList()[index]['jumlah'],
                                  harga: transaksiController.barang.values
                                      .toList()[index]['hargaAwal'],
                                  kategori: transaksiController.barang.values
                                      .toList()[index]['kategori'],
                                  rekomendasi: transaksiController.barang.values
                                      .toList()[index]['rekomendasiHarga'],
                                  transaksi: true,
                                );
                              });
                        },
                      ),
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
                          label: Text(
                            "Tambah Barang",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Roboto',
                                fontSize: 14.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 35),
                      Obx(() => Visibility(
                            visible: transaksiController.barang.isNotEmpty,
                            child: Card(
                                color: backgroundColor,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Total harga awal : "),
                                          Obx(() {
                                            return Text(transaksiController
                                                .jumlahHargaAwal()
                                                .toString());
                                          })
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Rekomendasi harga jual : "),
                                          Obx(() {
                                            return Text(transaksiController
                                                .jumlahRekomendasiHarga()
                                                .toString());
                                          })
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Harga deal saat ini : "),
                                          Obx(() {
                                            return Text(transaksiController
                                                .hargaDeal()
                                                .toString());
                                          })
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Laba : "),
                                          Obx(() {
                                            var laba = transaksiController
                                                    .hargaDeal() -
                                                transaksiController
                                                    .jumlahHargaAwal();
                                            return Text(laba.toString());
                                          })
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                          )),
                      SizedBox(
                        height: 35,
                      ),
                      SizedBox(
                        height: h * 0.05,
                        width: w,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              primary: primaryColor),
                          onPressed: () async {
                            await transaksiController.tambahTransaksi(context);
                          },
                          child: Text("Simpan Transaksi",
                              style: TextStyle(
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
