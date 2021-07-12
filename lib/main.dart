import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import './daftar_barang.dart' as daftarBarang;
import './tambah_transaksi.dart' as tambah_transaksi;
import './profil.dart' as profil;
import './analisis.dart' as analisis;

void main() {
  runApp(new MaterialApp(
    title: "Tab Bar",
    home: new HalamanSatu(),
  ));
}

class HalamanSatu extends StatefulWidget {
  const HalamanSatu({Key? key}) : super(key: key);

  @override
  _HalamanSatuState createState() => _HalamanSatuState();
}

class _HalamanSatuState extends State<HalamanSatu>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = new TabController( vsync: this, length: 4);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: new Material(
        color: Colors.amber,
        child: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.home),
              text: "Beranda",
            ),
            new Tab(
              icon: new Icon(Icons.task),
              text: "daftar barang",
            ),
            new Tab(
              icon: new Icon(Icons.add_task),
              text: "tambah transaksi",
            ),
            new Tab(
              icon: new Icon(Icons.analytics_sharp),
              text: "analisis",
            )
          ],
        ),
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new daftarBarang.daftarBarang(),
          new tambah_transaksi.tambah_transaksi(),
          new analisis.Analisis(),
          new profil.profil()
        ],
      ),
    );
  }
}
