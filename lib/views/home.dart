import 'package:flutter/material.dart';
import 'package:widuri/colors.dart';
import './daftar_barang.dart' as daftarBarang;
import './tambah_transaksi.dart' as tambahTransaksi;
import './analisis.dart' as analisis;
import './profil.dart' as profil;


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
late TabController controller;
@override
  void initState() {
  controller = new TabController(length: 5, vsync: this);
    super.initState();
  }
  @override
  void dispose() {
  controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: new FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: null,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
        elevation: 4.0,
      ),
      bottomNavigationBar: new Material(
        color: primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        child: new TabBar(
            controller: controller,
            tabs: <Widget>[
              new Tab(icon: Icon(Icons.home),text: 'Home',),
              new Tab(icon: Icon(Icons.task),text: 'Barang',),
              new Tab(text: 'Tambah'),
              new Tab(icon: Icon(Icons.analytics_outlined), text: 'Analisis',),
              new Tab(icon: Icon(Icons.person), text: 'Profil',),
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
}
