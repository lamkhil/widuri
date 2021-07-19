import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widuri/views/login.dart';
import 'package:widuri/views/navbar.dart';
import 'package:widuri/views/register.dart';
import 'package:widuri/views/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(
            name: '/',
            page: () => SplashScreen(),
            transition: Transition.zoom,
            transitionDuration: Duration(milliseconds: 500)),
        GetPage(
            name: '/login',
            page: () => Login(),
            transition: Transition.zoom,
            transitionDuration: Duration(milliseconds: 500)),
        GetPage(name: '/register', page: () => Register()),
        GetPage(name: '/main', page: () => NavBar('rudy')),
      ],
    );
  }
}
