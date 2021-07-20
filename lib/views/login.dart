import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widuri/colors.dart';
import 'package:widuri/model/m_user.dart';
import 'package:widuri/views/navbar.dart';
import 'package:widuri/views/register.dart';

import 'home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  bool _isHidden = true;
  final _email = TextEditingController();
  final _password = TextEditingController();

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
            'Login',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
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
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              controller: _password,
              obscureText: _isHidden,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(6),
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.password_rounded),
                  suffix: InkWell(
                    onTap: _togglePasswordView,
                    child: Icon(
                        _isHidden ? Icons.visibility : Icons.visibility_off),
                  ),
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.grey)),
            ),
          ),
          Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    Get.toNamed('/lupa_password');
                  },
                  child: Text("lupa kata sandi"))),
          SizedBox(height: 36),
          MaterialButton(
              onPressed: () async {},
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                width: w * 0.7,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Belum punya akun? "),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                  child: Text("Register")),
            ],
          )
        ],
      ),
    ));
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
