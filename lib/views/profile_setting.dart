import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widuri/controller/c_user.dart';
import 'package:widuri/gambar.dart';
import 'package:widuri/views/Widget/popup_riwayat.dart';
import 'package:widuri/views/riwayat_transaksi.dart';

import '../colors.dart';

class ProfileSetting extends StatefulWidget {
  const ProfileSetting({Key? key}) : super(key: key);

  @override
  _ProfileSettingState createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
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
                  Get.to(RiwayatTransaksi(), arguments: "bySelf");
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
                              "Dibuat oleh :\n" +
                              "\nMuhammad Lamkhil Bashor (185150201111015)" +
                              "\nRyan Sutawijaya (185150200111033)" +
                              "\nYualief Riswanda (185150207111008)");
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
                  C_User.logOutUser(context);
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
}
