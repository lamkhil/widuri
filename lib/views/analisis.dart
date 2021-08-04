import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widuri/controller/c_barang.dart';
import 'package:widuri/controller/c_transaksi.dart';

import '../colors.dart';
import 'Widget/category_widget.dart';
import 'Widget/graphic.dart';
import 'package:intl/intl.dart';

class Analisis extends StatefulWidget {
  const Analisis({Key? key}) : super(key: key);

  @override
  _AnalisisState createState() => _AnalisisState();
}

class _AnalisisState extends State<Analisis> {
  final barangController = Get.put(C_Barang());
  var _catatanController = TextEditingController();
  var transaksiController = Get.put(C_Transaksi());

  static const List<String> items = ['Bulan ini', 'Bulan Lalu'];
  int _activeCategory = 0;

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
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
                            width: 20.0,
                          ),
                          Expanded(
                            child: Container(
                              height: h * 0.05,
                              child: ListView.separated(
                                  clipBehavior: Clip.none,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, i) => CategoryWidget(
                                        name: '${items[i]}',
                                        isActive: _activeCategory == i,
                                        onClick: () {
                                          setState(() {
                                            _activeCategory = i;
                                          });
                                        },
                                      ),
                                  separatorBuilder: (context, i) => SizedBox(
                                        width: 20.0,
                                      ),
                                  itemCount: 2),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Pemasukan',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Roboto',
                                fontSize: 14.0,
                              )),
                          Text('+ Rp 1.900.000',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Roboto',
                                  fontSize: 14.0,
                                  color: greenFontColor)),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Pengeluaran',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Roboto',
                                fontSize: 14.0,
                              )),
                          Text('- Rp 900.000',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Roboto',
                                  fontSize: 14.0,
                                  color: greenFontColor)),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Divider(),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Keuntungan',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Roboto',
                                fontSize: 14.0,
                              )),
                          Text('+ Rp 900.000',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Roboto',
                                  fontSize: 14.0,
                                  color: greenFontColor)),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Divider(),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Produk Terlaris',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Roboto',
                                    fontSize: 14.0,
                                  )),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text('Baju Gamis Putih',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Roboto',
                                    fontSize: 13.0,
                                  )),
                            ],
                          ),
                          Column(
                            children: [
                              Text('Jumlah',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Roboto',
                                    fontSize: 14.0,
                                  )),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text('8',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Roboto',
                                    fontSize: 13.0,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text('Grafik Penjualan',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  fontSize: 16.0,
                )),
            SizedBox(height: 10.0),
            AspectRatio(
              aspectRatio: 1.5,
              child: Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 150,
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
                        child: grafik(),
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
              height: 20.0,
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
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Roboto',
                          fontSize: 16.0,
                        )))),
            SizedBox(
              height: 20.0,
            )
          ],
        ),
      ),
    );
  }
}
