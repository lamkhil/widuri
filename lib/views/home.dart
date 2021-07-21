import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:widuri/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'Widget/card_barang.dart';
import 'Widget/graphic.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const List<String> _list = ['Harian', 'Mingguan', 'Bulanan'];
  final auth = FirebaseAuth.instance;

  String _value = _list.first;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Hi, ${auth.currentUser!.displayName}!",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          backgroundColor: backgroundColor,
          elevation: 0,
          actions: [
            IconButton(onPressed: null, icon: Icon(Icons.notifications))
          ],
        ),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints viewport) {
          var h = MediaQuery.of(context).size.height;
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewport.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      Container(
                          margin: EdgeInsets.all(12),
                          child: Text(
                            'Stock Barang Menipis',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'RobotoMono',
                                color: Colors.black),
                          )),
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
                      Container(
                          margin: EdgeInsets.all(12),
                          child: Text(
                            'Tren Penjualan',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'RobotoMono',
                                color: Colors.black),
                          )),
                      Expanded(
                        child: AspectRatio(
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
                                  child: DropdownButtonFormField<String>(
                                    value: _value,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                    iconSize: 24,
                                    elevation: 16,
                                    style: TextStyle(color: Colors.black),
                                    onChanged: (var newValue) =>
                                        setState(() => _value = newValue!),
                                    items: _list
                                        .map((String item) =>
                                            DropdownMenuItem<String>(
                                                child: Text(item), value: item))
                                        .toList(),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 16.0, left: 6.0),
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
                      ),
                      const SizedBox(
                        height: 24,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
