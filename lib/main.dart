import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widuri/colors.dart';
import 'package:widuri/views/login.dart';
import 'package:widuri/views/lupa.dart';
import 'package:widuri/views/navbar.dart';
import 'package:widuri/views/profile.dart';
import 'package:widuri/views/register.dart';
import 'package:widuri/views/splashscreen.dart';
import 'package:widuri/views/verifikasi_email.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

const debug = true;
const String transaksi = debug ? 'transaksiDebug' : 'transaksi';
const String barang = debug ? 'barangDebug' : 'barang';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: primaryColor,
          accentColor: Colors.redAccent,
          fontFamily: 'Roboto'),
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(
            name: '/login',
            page: () => Login(),
            transition: Transition.fadeIn,
            transitionDuration: Duration(milliseconds: 500)),
        GetPage(name: '/lupa', page: () => LupaPassword()),
        GetPage(name: '/register', page: () => Register()),
        GetPage(name: '/main', page: () => NavBar()),
        GetPage(name: '/verif', page: () => VerifikasiEmail()),
        GetPage(name: '/profil', page: () => Profil()),
      ],
    );
  }
}
