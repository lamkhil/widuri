import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:widuri/controller/c_barang.dart';

import '../../colors.dart';

class PopUpBarang {
  String? kategori;
  String? namaBarang;
  int? hargaAwal;
  int? rekomendasiHarga;
  int? jumlah;
  String idBarang;
  bool edit;
  BuildContext context;

  PopUpBarang(
      {this.kategori,
      this.hargaAwal,
      this.jumlah,
      this.namaBarang,
      this.rekomendasiHarga,
      this.idBarang = '',
      required this.edit,
      required this.context});

  final _k = TextEditingController();
  final _n = TextEditingController();
  final _hA = MoneyMaskedTextController(
      leftSymbol: "Rp ",
      thousandSeparator: '.',
      precision: 0,
      decimalSeparator: "");
  final _rH = MoneyMaskedTextController(
      leftSymbol: "Rp ",
      thousandSeparator: '.',
      precision: 0,
      decimalSeparator: "");
  final _jmlh = BarangController();

  bool _simpan = false;
  bool _hapus = false;

  void popUpTambahBarang() {
    final _formKey = GlobalKey<FormState>();
    var _title = '';
    if (edit) {
      _k.text = kategori!;
      _n.text = namaBarang!;
      _hA.text = hargaAwal.toString();
      _rH.text = rekomendasiHarga.toString();
      _jmlh.textController.value.text = jumlah.toString();
      _title = 'Edit Barang';
    } else {
      _title = 'Tambah Barang';
    }
    showDialog(
        context: context,
        builder: (BuildContext context) {
          var w = MediaQuery.of(context).size.width;
          var h = MediaQuery.of(context).size.height;
          return AlertDialog(
              titlePadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              actionsPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              scrollable: true,
              title: Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10)),
                  color: primaryColor,
                ),
                child: Text(
                  _title,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                      color: Colors.white),
                ),
              ),
              content: Container(
                padding: EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Kategori',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Container(
                          constraints: BoxConstraints(maxWidth: w * 1),
                          child: Padding(
                            padding: EdgeInsets.zero,
                            child: new TextFormField(
                              maxLength: 10,
                              validator: (value) {
                                if (value == '') {
                                  return 'Jangan Dikosongi';
                                }
                                return null;
                              },
                              controller: _k,
                              decoration: new InputDecoration(
                                  hintText: 'Baju',
                                  focusColor: primaryColor,
                                  hintStyle:
                                      TextStyle(fontWeight: FontWeight.w300),
                                  focusedBorder: new OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(12.0),
                                      ),
                                      borderSide: BorderSide(
                                          color: primaryColor, width: 2.0)),
                                  border: new OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(12.0),
                                      ),
                                      borderSide: BorderSide(
                                          color: primaryColor, width: 2.0)),
                                  contentPadding: new EdgeInsets.symmetric(
                                      horizontal: 10.0)),
                              // onChanged: onSearchTextChanged,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 23.0,
                        ),
                        Text(
                          'Nama',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Container(
                          constraints: BoxConstraints(maxWidth: w * 1),
                          child: Padding(
                            padding: EdgeInsets.zero,
                            child: new TextFormField(
                              maxLength: 25,
                              validator: (value) {
                                if (value == '') {
                                  return 'Jangan Dikosongi';
                                }
                                return null;
                              },
                              controller: _n,
                              decoration: new InputDecoration(
                                  hintText: 'Baju Polo M',
                                  hintStyle:
                                      TextStyle(fontWeight: FontWeight.w300),
                                  focusedBorder: new OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(12.0),
                                      ),
                                      borderSide: BorderSide(
                                          color: primaryColor, width: 2.0)),
                                  border: new OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(12.0),
                                      ),
                                      borderSide: BorderSide(
                                          color: primaryColor, width: 2.0)),
                                  contentPadding: new EdgeInsets.symmetric(
                                      horizontal: 10.0)),
                              // onChanged: onSearchTextChanged,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 23.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              flex: 8,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  FittedBox(
                                    child: Text(
                                      'Harga Awal                ',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'RobotoMono'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.zero,
                                    child: new TextFormField(
                                      validator: (value) {
                                        if (value == '') {
                                          return 'Jangan Dikosongi';
                                        }
                                        return null;
                                      },
                                      controller: _hA,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        WhitelistingTextInputFormatter
                                            .digitsOnly,
                                      ],
                                      decoration: new InputDecoration(
                                          hintText: '13000',
                                          hintStyle: TextStyle(
                                              fontWeight: FontWeight.w300),
                                          focusedBorder: new OutlineInputBorder(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                const Radius.circular(12.0),
                                              ),
                                              borderSide: BorderSide(
                                                  color: primaryColor,
                                                  width: 2.0)),
                                          border: new OutlineInputBorder(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                const Radius.circular(12.0),
                                              ),
                                              borderSide: BorderSide(
                                                  color: primaryColor,
                                                  width: 2.0)),
                                          contentPadding:
                                              new EdgeInsets.symmetric(
                                                  horizontal: 10.0)),
                                      // onChanged: onSearchTextChanged,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(flex: 1, child: Container()),
                            Flexible(
                              flex: 8,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  FittedBox(
                                    child: Text(
                                      'HET',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'RobotoMono'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.zero,
                                    child: new TextFormField(
                                      validator: (value) {
                                        if (value == '') {
                                          return 'Jangan Dikosongi';
                                        }
                                        return null;
                                      },
                                      controller: _rH,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        WhitelistingTextInputFormatter
                                            .digitsOnly,
                                      ],
                                      decoration: new InputDecoration(
                                          hintText: '20000',
                                          hintStyle: TextStyle(
                                              fontWeight: FontWeight.w300),
                                          focusedBorder: new OutlineInputBorder(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                const Radius.circular(12.0),
                                              ),
                                              borderSide: BorderSide(
                                                  color: primaryColor,
                                                  width: 2.0)),
                                          border: new OutlineInputBorder(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                const Radius.circular(12.0),
                                              ),
                                              borderSide: BorderSide(
                                                  color: primaryColor,
                                                  width: 2.0)),
                                          contentPadding:
                                              new EdgeInsets.symmetric(
                                                  horizontal: 10.0)),
                                      // onChanged: onSearchTextChanged,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 23.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              constraints: BoxConstraints(
                                  maxWidth: w * 0.35, minHeight: 10),
                              child: Card(
                                elevation: 4.0,
                                margin: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Jumlah',
                                        style: TextStyle(
                                            color: primaryColor, fontSize: 10),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          IconButton(
                                              padding: EdgeInsets.zero,
                                              constraints: BoxConstraints(),
                                              onPressed: () {
                                                _jmlh.kurangJumlahBarang();
                                              },
                                              icon: Icon(
                                                Icons.remove_circle_rounded,
                                                color: primaryColor,
                                              )),
                                          SizedBox(
                                            width: 6.0,
                                          ),
                                          Expanded(
                                              child: Obx(
                                            () => FocusScope(
                                              onFocusChange: (value) {
                                                String result = _jmlh
                                                    .textController.value.text
                                                    .toString();
                                                if (value) {
                                                  if (result == '0') {
                                                    _jmlh.textController.value
                                                        .text = '';
                                                  }
                                                } else {
                                                  if (result == '' ||
                                                      result == '0') {
                                                    _jmlh.textController.value
                                                        .text = '1';
                                                  } else {
                                                    var i = int.parse(result);
                                                    if (i > 0) {
                                                      _jmlh.textController.value
                                                          .text = i.toString();
                                                    } else {
                                                      _jmlh.textController.value
                                                          .text = '1';
                                                    }
                                                  }
                                                }
                                              },
                                              child: TextFormField(
                                                textAlign: TextAlign.center,
                                                controller:
                                                    _jmlh.textController.value,
                                                keyboardType:
                                                    TextInputType.number,
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly
                                                ],
                                                decoration: InputDecoration(
                                                    border: InputBorder.none),
                                              ),
                                            ),
                                          )),
                                          SizedBox(
                                            width: 6.0,
                                          ),
                                          IconButton(
                                              padding: EdgeInsets.zero,
                                              constraints: BoxConstraints(),
                                              onPressed: () {
                                                _jmlh.tambahJumlahBarang();
                                              },
                                              icon: Icon(
                                                Icons.add_circle_rounded,
                                                color: primaryColor,
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ]),
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Visibility(
                          visible: edit,
                          child: Container(
                            height: h * 0.05,
                            width: w,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      side: BorderSide(color: primaryColor)),
                                  primary: backgroundColor,
                                ),
                                onPressed: () {
                                  _hapus = true;
                                  _simpan = false;
                                  Navigator.pop(Get.overlayContext!);
                                },
                                child: Text(
                                  'Hapus Barang',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Roboto',
                                      fontSize: 16.0,
                                      color: primaryColor),
                                )),
                          )),
                      SizedBox(height: 10.0),
                      Container(
                        height: h * 0.05,
                        width: w,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0)),
                              primary: primaryColor,
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _simpan = true;
                                _hapus = false;
                                Navigator.pop(Get.overlayContext!);
                              }
                            },
                            child: Text(
                              'Simpan Barang',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Roboto',
                                fontSize: 16.0,
                              ),
                            )),
                      )
                    ],
                  ),
                )
              ]);
        }).whenComplete(() {
      if (_hapus) {
        _k.text = '';
        _n.text = '';
        _hA.text = '';
        _rH.text = '';
        _verifHapus();
      }
      if (_simpan) {
        if (_formKey.currentState!.validate()) {
          var kategori = _k.text;
          var nama = _n.text;
          var hargaAwal = _hA.numberValue.toInt();
          var rekomHarga = _rH.numberValue.toInt();
          var j = _jmlh.textController.value.text.toString();
          _k.text = '';
          _n.text = '';
          _hA.text = '';
          _rH.text = '';
          _jmlh.textController.value.text = '1';
          BarangController.tambahBarang(context, kategori, nama, hargaAwal,
              rekomHarga, int.parse(j), idBarang);
        }
      }
    });
  }

  void _verifHapus() {
    _hapus = false;
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                'Peringatan!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              content: Text(
                  "Yakin ingin hapus barang?\nNama barang: $namaBarang\nID: $idBarang"),
              actions: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Visibility(
                        visible: edit,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  side: BorderSide(color: primaryColor)),
                              primary: backgroundColor,
                            ),
                            onPressed: () {
                              _hapus = true;
                              Navigator.pop(Get.overlayContext!);
                            },
                            child: Text(
                              'Ya',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Roboto',
                                  fontSize: 16.0,
                                  color: primaryColor),
                            )),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0)),
                            primary: primaryColor,
                          ),
                          onPressed: () {
                            _hapus = false;
                            Navigator.pop(Get.overlayContext!);
                          },
                          child: Text(
                            'Tidak',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Roboto',
                              fontSize: 16.0,
                            ),
                          )),
                    ],
                  ),
                )
              ],
            )).whenComplete(() {
      if (_hapus) {
        try {
          BarangController.hapusBarang(context, idBarang);
        } catch (e) {
          print(e);
        }
      }
    });
  }
}
