import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:widuri/colors.dart';
import 'package:widuri/controller/c_barang.dart';
import 'package:widuri/controller/c_user.dart';
import 'package:widuri/gambar.dart';
import 'package:widuri/router/routes.dart';
import 'package:widuri/views/screens/riwayat_transaksi.dart';

class ProfileSetting extends StatefulWidget {
  const ProfileSetting({Key? key}) : super(key: key);

  @override
  _ProfileSettingState createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  BarangController barangController = Get.find();
  final storage = GetStorage();
  final _minStockController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _minStockController.text = storage.read('minStock').toString();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _minStockController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 20.0),
        color: backgroundColor,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                leading: Icon(Icons.history),
                title: Text(
                  'Riwayat Transaksi Anda',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'RobotoMono',
                      color: Colors.black),
                ),
                onTap: () {
                  Get.toNamed(Routes.riwayatTransaksi, arguments: "bySelf");
                },
              ),
              Divider(),
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                leading: Icon(Icons.stacked_bar_chart),
                title: Text(
                  'Minimal Jumlah Stock',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'RobotoMono',
                      color: Colors.black),
                ),
                onTap: () {
                  _ubahJumlahStockMinimal();
                },
              ),
              Divider(),
              ListTile(
                onTap: () {
                  showAboutDialog(
                      context: context,
                      applicationVersion: '1.0.0',
                      applicationIcon: CircleAvatar(
                        backgroundImage: AssetImage(me),
                        backgroundColor: backgroundColor,
                        radius: 25.0,
                      ),
                      applicationName: 'Widuri Apps',
                      applicationLegalese:
                          "Widuri Apps adalah sebuah aplikasi akuntansi untuk toko Widuri di Pasar Dolopo, Madiun.\n\n\n" +
                              "Dibuat oleh :\n\n" +
                              "(185150201111015)\nMuhammad Lamkhil Bashor\n\n" +
                              "(185150200111033)\nRyan Sutawijaya\n\n" +
                              "(185150207111008)\nYualief Riswanda");
                },
                contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                leading: Icon(Icons.warning_amber_outlined),
                title: Text(
                  'About',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'RobotoMono',
                      color: Colors.black),
                ),
              ),
              Divider(),
              ListTile(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text("Peringatan!"),
                            content: Text("Yakin ingin keluar?"),
                            actions: [
                              Container(
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          side:
                                              BorderSide(color: primaryColor)),
                                      primary: backgroundColor,
                                    ),
                                    onPressed: () {
                                      UserController.logOutUser(context);
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
                              Container(
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                      primary: primaryColor,
                                    ),
                                    onPressed: () {
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
                              )
                            ],
                          ));
                },
                contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                leading: Icon(Icons.logout_rounded),
                title: Text(
                  'Keluar',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'RobotoMono',
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ));
  }

  void _ubahJumlahStockMinimal() {
    showModalBottomSheet<dynamic>(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.0),
        topRight: Radius.circular(10.0),
      )),
      context: context,
      isScrollControlled: true,
      builder: (context) => Container(
        child: Padding(
            padding: EdgeInsets.only(
                top: 20.0, right: 20.0, left: 20.0, bottom: 40.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Masukan jumlah minimal stock',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _minStockController,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14.0,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    SizedBox(
                      height: 40.0,
                      child: ElevatedButton(
                          onPressed: () {
                            var result = int.parse(_minStockController.text);
                            storage.write('minStock', result);
                            barangController.minStock.value = result;
                            barangController.barangList.refresh();
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: primaryColor,
                          ),
                          child: Text(
                            'Simpan',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.white),
                          )),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
