import 'package:flutter/material.dart';
import 'package:widuri/colors.dart';
import 'package:widuri/views/screens/dashboard/daftar%20barang/daftar_barang.dart';

class TambahBarangTransaksi extends StatefulWidget {
  const TambahBarangTransaksi({Key? key}) : super(key: key);

  @override
  _TambahBarangTransaksiState createState() => _TambahBarangTransaksiState();
}

class _TambahBarangTransaksiState extends State<TambahBarangTransaksi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          'Tambah Transaksi',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: BodyBarang.bodyDaftarBarang(context, true),
    );
  }
}
