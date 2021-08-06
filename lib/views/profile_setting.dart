import 'package:flutter/material.dart';
import 'package:widuri/controller/c_user.dart';

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
                  'Riwayat Pembayaran',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'RobotoMono',
                      color: Colors.black),
                ),
              ),
              Divider(),
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                leading: Icon(Icons.notifications_none_rounded),
                title: Text(
                  'Permberitahuan',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'RobotoMono',
                      color: Colors.black),
                ),
              ),
              Divider(),
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                leading: Icon(Icons.help_outline_rounded),
                title: Text(
                  'Panduan',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'RobotoMono',
                      color: Colors.black),
                ),
              ),
              Divider(),
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                leading: Icon(Icons.verified_user_outlined),
                title: Text(
                  'Kebijakan Privasi',
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
