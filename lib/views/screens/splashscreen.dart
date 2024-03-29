import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:widuri/colors.dart';
import 'package:widuri/router/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final storage = GetStorage();
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var _duration = new Duration(seconds: 1);
    return new Timer(_duration, navigatePage);
  }

  void navigatePage() async {
    var user = storage.read('user');
    var minimalStock = storage.read('minStock');
    if (minimalStock == null) {
      storage.write('minStock', 3);
    }
    if (user == null) {
      Get.offNamed(Routes.loginScreen);
    } else {
      Get.offNamed(Routes.dashboardScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Text(
              'WIDURI',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                  fontSize: 36),
            ),
          ),
        ));
  }
}
