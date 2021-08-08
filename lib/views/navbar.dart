import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:widuri/colors.dart';
import 'package:widuri/controller/c_user.dart';

import 'analisis.dart';
import 'daftar_barang.dart';
import 'home.dart';
import 'profile.dart';
import 'tambah_transaksi.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final auth = FirebaseAuth.instance;
  late PersistentTabController _controller;
  late bool _hideNavBar;

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
    C_User.name.value = auth.currentUser!.displayName!;
    C_User.photoUrl.value = auth.currentUser!.photoURL!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: primaryColor, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12.0),
          topLeft: Radius.circular(12.0),
        ),
        colorBehindNavBar: Colors.white,
      ),

      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style9, // Choose the nav bar style with this property.
    );
  }

  List<Widget> _buildScreens() {
    return [Home(), DaftarBarang(), TambahTransaksi(), Analisis(), Profil()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.house),
        title: ("Beranda"),
        activeColorPrimary: CupertinoColors.white,
        inactiveColorPrimary: CupertinoColors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.archivebox),
        title: ("Daftar Barang"),
        activeColorPrimary: CupertinoColors.white,
        inactiveColorPrimary: CupertinoColors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.plus_square),
        title: ("Tambah Transaksi"),
        activeColorPrimary: CupertinoColors.white,
        inactiveColorPrimary: CupertinoColors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.graph_square),
        title: ("Analisis"),
        activeColorPrimary: CupertinoColors.white,
        inactiveColorPrimary: CupertinoColors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person),
        title: ("Profil"),
        activeColorPrimary: CupertinoColors.white,
        inactiveColorPrimary: CupertinoColors.white,
      ),
    ];
  }
}
