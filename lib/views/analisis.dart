import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widuri/controller/c_barang.dart';

import '../colors.dart';
import 'Widget/graphic.dart';

class Analisis extends StatefulWidget {
  const Analisis({Key? key}) : super(key: key);

  @override
  _AnalisisState createState() => _AnalisisState();
}

class _AnalisisState extends State<Analisis> {
  final barangController = Get.put(C_Barang());

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundColor,
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
        padding: EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                      color: primaryColor, width: 1)),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    child: Icon(
                                      Icons.date_range_rounded,
                                      color: primaryColor,
                                    ),
                                    onTap: () {},
                                  ),
                                  SizedBox(
                                    width: 12.0,
                                  ),
                                  Text(
                                    'Pilih Tanggal',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w300,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: h * 0.05,
                            width: w * 0.2,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  primary: primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(12.0))),
                              child: Text(
                                'Bulan ini',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto',
                                    fontSize: 14.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: h * 0.05,
                            width: w * 0.2,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(12.0),
                                  primary: primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(12.0))),
                              child: Text(
                                'Bulan lalu',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto',
                                    fontSize: 14.0),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 23.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Pemasukan',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Roboto',
                                fontSize: 16.0,
                              )),
                          Text('+ Rp 1.900.000',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Roboto',
                                  fontSize: 16.0,
                                  color: greenFontColor)),
                        ],
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Pengeluaran',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Roboto',
                                fontSize: 16.0,
                              )),
                          Text('- Rp 900.000',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Roboto',
                                  fontSize: 16.0,
                                  color: greenFontColor)),
                        ],
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Divider(),
                      SizedBox(
                        height: 12.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Keuntungan',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Roboto',
                                fontSize: 16.0,
                              )),
                          Text('+ Rp 900.000',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Roboto',
                                  fontSize: 16.0,
                                  color: greenFontColor)),
                        ],
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Divider(),
                      SizedBox(
                        height: 12.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text('Produk Terlaris',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Roboto',
                                    fontSize: 16.0,
                                  )),
                              SizedBox(
                                height: 6.0,
                              ),
                              Text('Baju Gamis Putih',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Roboto',
                                    fontSize: 14.0,
                                  )),
                            ],
                          ),
                          Column(
                            children: [
                              Text('Jumlah',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Roboto',
                                    fontSize: 16.0,
                                  )),
                              SizedBox(
                                height: 6.0,
                              ),
                              Text('8',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Roboto',
                                    fontSize: 14.0,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 23.0,
            ),
            Text('Grafik Penjualan',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  fontSize: 18.0,
                )),
            SizedBox(height: 12.0),
            AspectRatio(
              aspectRatio: 1.5,
              child: Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      width: w * 0.3,
                      child: Obx(() {
                        return DropdownButtonFormField<String>(
                          value: barangController.valueDropdownHome.value,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.black),
                          onChanged: (var newValue) => barangController
                              .valueDropdownHome.value = newValue!,
                          items: C_Barang.listDropdownHome
                              .map((String item) => DropdownMenuItem<String>(
                                  child: Text(item), value: item))
                              .toList(),
                        );
                      }),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16.0, left: 6.0),
                        child: LineChart(
                          sampleData1(),
                          swapAnimationDuration:
                              const Duration(milliseconds: 250),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 23.0,
            ),
            SizedBox(
                width: w - 23.0,
                height: h * 0.05,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(10.0),
                        primary: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        )),
                    onPressed: () {},
                    child: Text('Catat Transaksi',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          fontSize: 16.0,
                        )))),
          ],
        ),
      ),
    );
  }
}
