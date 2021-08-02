import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widuri/controller/c_user.dart';

import '../colors.dart';

class LupaPassword extends StatefulWidget {
  const LupaPassword({Key? key}) : super(key: key);

  @override
  _LupaPasswordState createState() => _LupaPasswordState();
}

class _LupaPasswordState extends State<LupaPassword> {
  var _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          iconTheme: IconThemeData(color: primaryColor),
        ),
        body: Container(
          decoration: BoxDecoration(color: backgroundColor),
          height: h,
          width: w,
          child :ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'WIDURI',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                        fontSize: 36),
                  ),
                  SizedBox(height: 37),
                  Text(
                    'Lupa Password',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _email,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(6),
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(height: 36),
                  MaterialButton(
                      onPressed: () {
                        C_User.lupaPassword(context, _email.text);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        width: w * 0.7,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: Text(
                          'Kirim Email',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      )),
                ],
              ),
            ],
          )

        ));
  }
}
