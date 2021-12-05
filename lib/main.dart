import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widuri/bindings/user_bindings.dart';
import 'package:widuri/colors.dart';
import 'package:widuri/router/routes_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

const debug = false;
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
        initialBinding: UserBinding(),
        getPages: AppPage.pages);
  }
}
