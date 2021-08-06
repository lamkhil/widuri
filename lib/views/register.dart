import 'package:flutter/material.dart';
import 'package:widuri/colors.dart';
import 'package:widuri/controller/c_user.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final email = TextEditingController();
  final nama = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    email.dispose();
    nama.dispose();
    password.dispose();
    super.dispose();
  }

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
                controller: nama,
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
                controller: email,
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
                controller: password,
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
              onPressed: () async {
                C_User.registerUser(
                    context, email.text, password.text, nama.text);
              },
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
