import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:widuri/views/Widget/alert_dialog.dart';

import '../colors.dart';
import 'Widget/loader_dialog.dart';

class LupaPassword extends StatelessWidget {
  final auth = FirebaseAuth.instance;

  final _c_email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      height: h,
      width: w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'WIDURI',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: primaryColor, fontSize: 36),
          ),
          SizedBox(height: 37),
          Text(
            'Lupa Password',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              controller: _c_email,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(6),
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.grey),
              ),
              onChanged: (String value) {},
            ),
          ),
          SizedBox(height: 36),
          MaterialButton(
              onPressed: () async {
                loaderDialog(
                    context,
                    SpinKitFadingCube(color: Colors.lime[900]),
                    'Tunggu Sebentar!');
                auth.sendPasswordResetEmail(email: _c_email.text);
                await Future.delayed(Duration(seconds: 2));
                Navigator.of(context).pop();
                customDialog(context, 'Sukses!',
                    "Alhamdulillah, silahkan cek emailnya!");
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                width: w * 0.7,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Text(
                  'Lupa Password',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              )),
        ],
      ),
    ));
  }
}
