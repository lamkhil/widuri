import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:widuri/colors.dart';
import 'package:widuri/controller/c_user.dart';
import 'package:widuri/model/m_user.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        toolbarHeight: 100.0,
        title: Container(
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
                            color: Colors.black),
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
                            color: Colors.black),
                      )
                    ],
                  ),
                ],
              ),
              FlatButton(
                padding: EdgeInsets.all(6.0),
                child: Icon(
                  Icons.notifications,
                  color: Colors.black38,
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
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(12, 23, 12, 23),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tampilan Nama',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'RobotoMono',
                          color: Colors.black),
                    ),
                    Text(
                      '${auth.currentUser!.displayName}',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'RobotoMono',
                          color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Ubah',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'RobotoMono',
                          color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () {

                      },
                      child: Icon(Icons.arrow_forward_ios_rounded),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 12.0,
            ),
            Divider(),
            SizedBox(
              height: 12.0,
            ),
            TextButton(
                onPressed: () async {
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
}
