import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../colors.dart';
import 'Widget/loader_dialog.dart';

class VerifikasiEmail extends StatefulWidget {
  const VerifikasiEmail({Key? key}) : super(key: key);

  @override
  _VerifikasiEmailState createState() => _VerifikasiEmailState();
}

class _VerifikasiEmailState extends State<VerifikasiEmail> {
  final auth = FirebaseAuth.instance;
  late User user;
  late Timer timer;
  var data = Get.arguments;

  @override
  void initState() {
    user = auth.currentUser!;
    user.sendEmailVerification();
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'WIDURI',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                    fontSize: 36),
              ),
              SizedBox(
                height: 36,
              ),
              Center(
                child: Text(
                  "Verifikasi Email sudah dikirim pada\n${user.email}\nsilahkan cek email Anda",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'RobotoMono'),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )),
    );
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser!;
    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      await user.updateDisplayName(data);
      Get.offNamed('/main');
    }
  }
}
