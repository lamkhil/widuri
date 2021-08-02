import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../colors.dart';

class ProfileNama extends StatefulWidget {
  const ProfileNama({Key? key}) : super(key: key);

  @override
  _ProfileNamaState createState() => _ProfileNamaState();
}

class _ProfileNamaState extends State<ProfileNama> {
  final auth = FirebaseAuth.instance;
  final TextEditingController _namaController = TextEditingController();
  bool _focus = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 20.0),
        color: backgroundColor,
        child: ListView(
          shrinkWrap: true,
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
              )]));
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
