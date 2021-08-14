import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widuri/controller/c_user.dart';

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
  var nama = ''.obs;
  

  @override
  Widget build(BuildContext context) {
    nama.value = auth.currentUser!.displayName!;
    return Container(
        padding: EdgeInsets.only(top: 20.0),
        color: backgroundColor,
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                subtitle: Obx(
                  () => Text(
                    C_User.name.value,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'RobotoMono',
                        color: Colors.black),
                  ),
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
              )
            ])));
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
                top: 20.0, right: 20.0, left: 20.0, bottom: 40.0),
            child: Column(
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
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        autofocus: _focus,
                        controller: _namaController,
                        decoration: InputDecoration(
                          hintText: '${auth.currentUser!.displayName}',
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
                          onPressed: () async {
                            await C_User.ubahNama(
                                context, _namaController.text);
                            _namaController.text = '';
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
