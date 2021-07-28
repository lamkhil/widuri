import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:widuri/colors.dart';
import 'package:widuri/controller/c_transaksi.dart';
import 'package:widuri/views/Widget/popup_barang.dart';

class CardBarang extends StatelessWidget {
  CardBarang(
      {required this.namaBarang,
      required this.idBarang,
      required this.jumlah,
      required this.harga,
      required this.kategori,
      required this.rekomendasi,
      this.transaksi = false});

  String namaBarang;
  String idBarang;
  String kategori;
  int jumlah;
  int harga;
  int rekomendasi;
  bool transaksi;
  RxInt jumlahTransaksi = 0.obs;
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
                          width: w * 0.275,
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
                    Container(
                      width: w * 0.45,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Visibility(
                            visible: !transaksi,
                            child: Container(
                              width: w * 0.074,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    FittedBox(
                                      child: Text(
                                        'Stock',
                                        style: TextStyle(color: primaryColor),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4.0,
                                    ),
                                    FittedBox(
                                      child: Text(
                                        '$jumlah',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                          Visibility(
                            visible: !transaksi,
                            child: SizedBox(
                              width: w * 0.014,
                            ),
                          ),
                          Container(
                            width: w * 0.14,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                FittedBox(
                                  child: Text(
                                    'Harga Awal',
                                    style: TextStyle(
                                      color: primaryColor,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 4.0,
                                ),
                                FittedBox(
                                  child: Text('Rp $harga', style: TextStyle()),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: w * 0.014,
                          ),
                          Visibility(
                            visible: !transaksi,
                            child: Container(
                              width: w * 0.14,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  FittedBox(
                                    child: Text(
                                      'Harga Jual',
                                      style: TextStyle(
                                        color: primaryColor,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4.0,
                                  ),
                                  FittedBox(child: Text('Rp $rekomendasi')),
                                ],
                              ),
                            ),
                          ),
                          Builder(builder: (context) {
                            if (transaksi) {
                              C_Transaksi transaksiController = Get.find();
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        if (jumlahTransaksi.value > 0) {
                                          jumlahTransaksi--;
                                          transaksiController
                                                  .barang.value[idBarang]
                                              ['jumlahTransaksi']--;
                                          transaksiController.barang
                                              .value[idBarang]['jumlah']++;
                                          if (jumlahTransaksi == 0) {
                                            if (transaksiController.barang.value
                                                .containsKey(idBarang))
                                              transaksiController.barang.value
                                                  .remove(idBarang);
                                          }
                                          transaksiController.barang.refresh();
                                        }
                                      },
                                      icon: Icon(
                                        Icons.remove_circle_rounded,
                                        color: primaryColor,
                                      )),
                                  FittedBox(child: Obx(() {
                                    jumlahTransaksi.value = transaksiController
                                            .barang.value
                                            .containsKey(idBarang)
                                        ? transaksiController.barang
                                            .value[idBarang]['jumlahTransaksi']
                                        : 0;
                                    return Text(
                                        jumlahTransaksi.value.toString());
                                  })),
                                  IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        if (jumlahTransaksi < jumlah) {
                                          jumlahTransaksi++;
                                          if (transaksiController.barang.value
                                              .containsKey(idBarang)) {
                                            transaksiController
                                                    .barang.value[idBarang]
                                                ['jumlahTransaksi']++;
                                            transaksiController.barang
                                                .value[idBarang]['jumlah']--;
                                          } else {
                                            transaksiController.barang.value
                                                .addAll({
                                              idBarang: {
                                                'jumlahTransaksi': 1,
                                                'hargaAwal': harga,
                                                'id': idBarang,
                                                'kategori': kategori,
                                                'namaBarang': namaBarang,
                                                'rekomendasiHarga': rekomendasi,
                                                'jumlah': jumlah
                                              }
                                            });
                                          }
                                          transaksiController.barang.refresh();
                                        }
                                      },
                                      icon: Icon(
                                        Icons.add_circle_rounded,
                                        color: primaryColor,
                                      ))
                                ],
                              );
                            } else {
                              return Container(
                                width: w * 0.05,
                                child: FittedBox(
                                  child: IconButton(
                                    onPressed: () {
                                      PopUpBarang(
                                              edit: true,
                                              context: context,
                                              kategori: this.kategori,
                                              hargaAwal: harga,
                                              rekomendasiHarga: rekomendasi,
                                              namaBarang: this.namaBarang,
                                              jumlah: this.jumlah,
                                              idBarang: this.idBarang)
                                          .popUpTambahBarang();
                                    },
                                    icon: Icon(Icons.arrow_forward_ios_rounded),
                                  ),
                                ),
                              );
                            }
                          })
                        ],
                      ),
                    )
                  ],
                ),
              ))),
    );
  }
}
