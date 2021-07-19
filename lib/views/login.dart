import 'package:flutter/material.dart';
import 'package:widuri/colors.dart';
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
  String _email = '', _kataSandi = '';

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
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(6),
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.grey),
              ),
              onChanged: (String value) {
                setState(() {
                  _email = value;
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                  child: Text("lupa kata sandi"))),
          SizedBox(height: 36),
          MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NavBar(_email)));
              },
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
              ))
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
