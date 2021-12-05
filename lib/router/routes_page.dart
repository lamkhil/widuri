import 'package:get/get.dart';
import 'package:widuri/bindings/bindings.dart';
import 'package:widuri/router/routes.dart';
import 'package:widuri/views/Widget/tambah_barang_transaksi.dart';
import 'package:widuri/views/screens/login.dart';
import 'package:widuri/views/screens/lupa.dart';
import 'package:widuri/views/screens/dashboard/dashboard.dart';
import 'package:widuri/views/screens/dashboard/profil/profile.dart';
import 'package:widuri/views/screens/register.dart';
import 'package:widuri/views/screens/riwayat_transaksi.dart';
import 'package:widuri/views/screens/splashscreen.dart';
import 'package:widuri/views/screens/verifikasi_email.dart';

class AppPage {
  static final pages = [
    GetPage(name: Routes.splashScreen, page: () => SplashScreen()),
    GetPage(
        name: Routes.loginScreen,
        page: () => Login(),
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(name: Routes.forgetPasswordScreen, page: () => LupaPassword()),
    GetPage(name: Routes.registerScreen, page: () => Register()),
    GetPage(
        name: Routes.dashboardScreen,
        page: () => Dashboard(),
        bindings: [BarangBinding(), TransaksiBinding()]),
    GetPage(name: Routes.verifyScreen, page: () => VerifikasiEmail()),
    GetPage(name: Routes.profilScreen, page: () => Profil()),
    GetPage(name: Routes.riwayatTransaksi, page: () => RiwayatTransaksi()),
    GetPage(
        name: Routes.tambahBarangTransaksi,
        page: () => TambahBarangTransaksi()),
  ];
}
