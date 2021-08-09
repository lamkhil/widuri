import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:widuri/controller/c_barang.dart';
import 'package:widuri/controller/c_transaksi.dart';
import 'package:widuri/views/Widget/loader_dialog.dart';

import '../colors.dart';
import 'Widget/category_widget.dart';
import 'Widget/graphic.dart';
import 'Widget/notif_popup.dart';

class Analisis extends StatefulWidget {
  const Analisis({Key? key}) : super(key: key);

  @override
  _AnalisisState createState() => _AnalisisState();
}

class _AnalisisState extends State<Analisis> {
  final barangController = Get.put(C_Barang());
  var _catatanController = TextEditingController();
  var transaksiController = Get.put(C_Transaksi());

  static const List<String> items = ['Minggu ini', 'Minggu Lalu'];

  @override
  void initState() {
    // TODO: implement initState
    transaksiController.updateDataAnalisis();
    super.initState();
  }

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
                'Analisis',
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'RobotoMono',
                    color: Colors.black),
              ),
              Card(
                color: backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: IconButton(
                  onPressed: () {
                    NotifBuildShowDialog(context);
                  },
                  icon: Icon(
                    Icons.notifications,
                    size: 20.0,
                    color: primaryColor,
                  ),
                ),
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
                          Obx(
                            () {
                              var date = transaksiController.dateAnalisis.value;
                              var start =
                                  DateFormat('dd/MM/yyyy').format(date.start);
                              var end =
                                  DateFormat('dd/MM/yyyy').format(date.end);
                              String label = "$start - $end";
                              bool isActive =
                                  transaksiController.activeCategory.value == 3;
                              return Container(
                                height: h * 0.05,
                                width: w * 0.4,
                                constraints: BoxConstraints(maxWidth: 250),
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                    color: isActive
                                        ? primaryColor
                                        : backgroundColor,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: primaryColor,
                                      width: 1.0,
                                    )),
                                child: InkWell(
                                  onTap: () async {
                                    transaksiController.activeCategory.value =
                                        3;
                                    final DateTimeRange? picked =
                                        await showDateRangePicker(
                                      context: context,
                                      firstDate:
                                          DateTime(DateTime.now().year - 5),
                                      lastDate:
                                          DateTime(DateTime.now().year + 5),
                                      initialDateRange: DateTimeRange(
                                        end: transaksiController
                                            .dateAnalisis.value.end,
                                        start: transaksiController
                                            .dateAnalisis.value.start,
                                      ),
                                    );
                                    if (picked != null) {
                                      transaksiController.dateAnalisis.value =
                                          picked;
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        width: w * 0.05,
                                        constraints:
                                            BoxConstraints(maxWidth: h * 0.04),
                                        child: FittedBox(
                                          child: Icon(
                                            Icons.date_range,
                                            color: isActive
                                                ? backgroundColor
                                                : primaryColor,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: w * 0.25,
                                        constraints:
                                            BoxConstraints(maxWidth: 150),
                                        child: FittedBox(
                                          child: Text(
                                            label,
                                            style: TextStyle(
                                                color: isActive
                                                    ? backgroundColor
                                                    : Colors.black),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Expanded(
                            child: Container(
                                height: h * 0.05,
                                child: ListView.separated(
                                    clipBehavior: Clip.none,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, i) => Obx(
                                          () => Container(
                                            width: w * 0.2,
                                            child: CategoryWidget(
                                              name: '${items[i]}',
                                              isActive: transaksiController
                                                      .activeCategory.value ==
                                                  i,
                                              onClick: () {
                                                transaksiController
                                                    .activeCategory.value = i;

                                                switch (i) {
                                                  case 0:
                                                    var date = DateTime.now();
                                                    transaksiController.dateAnalisis.value = DateTimeRange(
                                                        end: transaksiController
                                                            .getDate(date.add(Duration(
                                                                days: DateTime
                                                                        .daysPerWeek -
                                                                    date
                                                                        .weekday))),
                                                        start: transaksiController
                                                            .getDate(date.subtract(
                                                                Duration(days: date.weekday - 1))));
                                                    break;
                                                  case 1:
                                                    var date = DateTime(
                                                        DateTime.now().year,
                                                        DateTime.now().month,
                                                        DateTime.now().day - 7);
                                                    transaksiController.dateAnalisis.value = DateTimeRange(
                                                        end: transaksiController
                                                            .getDate(date.add(Duration(
                                                                days: DateTime
                                                                        .daysPerWeek -
                                                                    date
                                                                        .weekday))),
                                                        start: transaksiController
                                                            .getDate(date.subtract(
                                                                Duration(days: date.weekday - 1))));
                                                    break;
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                    separatorBuilder: (context, i) => SizedBox(
                                          width: 6.0,
                                        ),
                                    itemCount: 2)),
                          ),
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
                          Obx(
                            () => Text(
                                '+' +
                                    transaksiController.analisis['pemasukan']
                                        .toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Roboto',
                                    fontSize: 14.0,
                                    color: greenFontColor)),
                          ),
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
                          Obx(
                            () => Text(
                                '-' +
                                    transaksiController.analisis['pengeluaran']
                                        .toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Roboto',
                                    fontSize: 14.0,
                                    color: primaryColor)),
                          ),
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
                          Obx(
                            () => Text(
                                '+' +
                                    transaksiController.analisis['keuntungan']
                                        .toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Roboto',
                                    fontSize: 14.0,
                                    color: greenFontColor)),
                          ),
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
                              Obx(
                                () => Text(
                                    transaksiController
                                        .analisis['namaBarangTerlaris']
                                        .toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Roboto',
                                      fontSize: 13.0,
                                    )),
                              ),
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
                              Obx(
                                () => Text(
                                    transaksiController
                                        .analisis['jumlahBarangTerlaris']
                                        .toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Roboto',
                                      fontSize: 13.0,
                                    )),
                              ),
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
                    onPressed: () async {
                      await transaksiController.catatTransaksi(context);
                    },
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
