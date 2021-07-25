import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widuri/controller/c_user.dart';

import '../colors.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _tanggalLahirController = TextEditingController();
  bool _focus = true;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 2.0,
        toolbarHeight: 80.0,
        title: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
              )),
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://www.trendrr.net/wp-content/uploads/2017/06/Deepika-Padukone-1.jpg",
                    ),
                    radius: 25.0,
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${auth.currentUser!.displayName} ',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'RobotoMono',
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 4.0,
                      ),
                      Text(
                        '${auth.currentUser!.uid}',
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'RobotoMono',
                            color: Colors.white),
                      )
                    ],
                  ),
                ],
              ),
              FlatButton(
                padding: EdgeInsets.all(6.0),
                child: Icon(
                  Icons.notifications,
                  color: primaryColor,
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
      ),
      body: Container(
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              color: backgroundColor,
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    title: Text(
                      'E-mail',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'RobotoMono',
                          color: Colors.black),
                    ),
                    subtitle: Text(
                      '${auth.currentUser!.email}',
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
                    title: Text(
                      'Tampilan Nama',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'RobotoMono',
                          color: Colors.black),
                    ),
                    subtitle: Text(
                      '${auth.currentUser!.displayName}',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'RobotoMono',
                          color: Colors.black),
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        _onPressChangeName();
                      },
                      child: Text(
                        'Ubah',
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'RobotoMono',
                            color: Colors.blue),
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    title: Text(
                      'Tanggal lahir',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'RobotoMono',
                          color: Colors.black),
                    ),
                    subtitle: Text(
                      '12-12-1999',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'RobotoMono',
                          color: Colors.black),
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        _onPressChangeTanggalLahir();
                      },
                      child: Text(
                        'Ubah',
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'RobotoMono',
                            color: Colors.blue),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              color: backgroundColor,
              child: Column(
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
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextButton(
                onPressed: ()async {
                  await C_User.logOutUser(context);
                },
                child: Text(
                  'KELUAR',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'RobotoMono',
                      color: Colors.red),
                ))
          ],
        ),
      ),
    );
  }

  void _onPressChangeTanggalLahir() {
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
                top: 20.0,
                right: 20.0,
                left: 20.0,
                bottom : MediaQuery.of(context).viewInsets.bottom
            ),
            child : Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Masukan tanggal lahir anda',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  autofocus: _focus,
                  controller: _tanggalLahirController,
                  decoration: InputDecoration(
                      hintText: '12-12-1999',
                      hintStyle: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w300),
                      suffixIcon: Icon(
                        Icons.date_range_rounded,
                        color: primaryColor,
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Batal',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: primaryColor),
                        )),
                    SizedBox(
                      width: 10.0,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Simpan',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: primaryColor),
                        ))
                  ],
                )
              ],
            )
        ),
      ),
    );
  }

  void _onPressChangeName() {
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
                top: 20.0,
                right: 20.0,
                left: 20.0,
                bottom : MediaQuery.of(context).viewInsets.bottom
            ),
            child : Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Masukan nama anda',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  autofocus: _focus,
                  controller: _namaController,
                  decoration: InputDecoration(
                      hintText: '${auth.currentUser!.displayName}',
                      hintStyle: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w300),
                      suffixIcon: Icon(
                        Icons.date_range_rounded,
                        color: primaryColor,
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Batal',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: primaryColor),
                        )),
                    SizedBox(
                      width: 10.0,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Simpan',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: primaryColor),
                        ))
                  ],
                )
              ],
            )
        ),
      ),
    );
  }

}
