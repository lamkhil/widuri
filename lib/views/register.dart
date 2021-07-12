import 'package:flutter/material.dart';
import 'package:widuri/colors.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
            'Daftar',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(6),
                    labelText: 'Nama',
                    prefixIcon: Icon(Icons.people),
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.grey))),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(6),
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.supervised_user_circle),
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.grey))),
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
                        color: Colors.grey))),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(6),
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.password_rounded),
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.grey))),
          ),
          SizedBox(height: 36),
          MaterialButton(
              onPressed: null,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                width: w * 0.7,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Text(
                  'Daftar',
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
}
