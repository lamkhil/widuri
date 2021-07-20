import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:widuri/gambar.dart';

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
          child : Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(amico),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Link verifikasi telah dikirimkan ke ${user.email} . Segera cek email dan klik link yang ada agar dapat memasuki aplikasi',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
          )
          ),
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
