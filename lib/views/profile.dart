import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widuri/controller/c_transaksi.dart';
import 'package:widuri/controller/c_user.dart';
import 'package:widuri/views/Widget/alert_dialog.dart';

import './profile_nama.dart' as ProfilNama;
import './profile_setting.dart' as ProfilSetting;
import '../colors.dart';
import 'Widget/profil_Image.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> with SingleTickerProviderStateMixin {
  final auth = FirebaseAuth.instance;
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[primaryColor, orange],
                tileMode: TileMode.repeated),
          ),
        ),
        title: Container(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Profil',
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'RobotoMono',
                    color: backgroundColor),
              ),
              // Card(
              //   color: backgroundColor,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(12.0),
              //   ),
              //   child: IconButton(
              //     onPressed: () {
              //       NotifBuildShowDialog(context);
              //     },
              //     icon: Icon(
              //       Icons.notifications,
              //       size: 20.0,
              //       color: primaryColor,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        backgroundColor: orange,
        elevation: 0,
      ),
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Column(
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  width: double.infinity,
                  height: h * 0.2,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color>[primaryColor, orange],
                        tileMode: TileMode.repeated),
                  ),
                ),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.fromLTRB(20, 60, 20, 20),
                        color: backgroundColor,
                        child: Column(
                          children: [
                            Obx(
                              () => Text(
                                C_User.name.value,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                              ),
                              child: TabBar(
                                controller: _tabController,
                                // give the indicator a decoration (color and border radius)
                                indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    20.0,
                                  ),
                                  color: primaryColor,
                                ),
                                labelColor: Colors.white,
                                unselectedLabelColor: Colors.black,
                                tabs: [
                                  //tab pertama
                                  Tab(
                                    text: 'Profil',
                                  ),
                                  //tab kedua
                                  Tab(
                                    text: 'Setting',
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                                child: TabBarView(
                              controller: _tabController,
                              children: [
                                //tabview pertama
                                new ProfilNama.ProfileNama(),
                                // second tab bar view widget
                                new ProfilSetting.ProfileSetting(),
                              ],
                            ))
                          ],
                        ))),
              ],
            ),
            Positioned(
                // (background container size(size container/appbar atas)) - (circle height / 2)
                top: (h * 0.2) - (100 / 2),
                child: Container(
                    height: 100.0, width: 100.0, child: profilImage())),
            Positioned(
                // (background container size(size container/appbar atas)) - (circle height / 2)
                top: (h * 0.2) - (100 / 2) + 60,
                left: w * 0.5 + 10,
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: orange,
                      border: Border.all(color: backgroundColor, width: 6)),
                  child: IconButton(
                    onPressed: () {
                      if (kIsWeb) {
                        customDialog(context, "Oops!",
                            "Gunakan perangkat mobile untuk mengubah foto");
                      } else {
                        _showPicker(context);
                      }
                    },
                    icon: Icon(
                      Icons.edit_rounded,
                      color: backgroundColor,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void _showPicker(context) {
    var i = 0;
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        i = 1;
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      i = 2;
                      Navigator.of(context).pop();
                    },
                  ),
                  new ListTile(
                    leading: new Icon(Icons.delete),
                    title: new Text('Hapus'),
                    onTap: () {
                      i = 3;
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }).then((value) async {
      if (i == 1) {
        if (!await C_User.imgFromGallery(context)) {
          customDialog(context, "Gagal", "Izin belum diberikan");
        }
      }
      if (i == 2) {
        if (!await C_User.imgFromCamera(context)) {
          customDialog(context, "Gagal", "Izin belum diberikan");
        }
      }
      if (i == 3 && auth.currentUser!.photoURL != null) {
        auth.currentUser!.updatePhotoURL(null);
        C_User.photoUrl.value = "";
        var firebaseStorage = FirebaseStorage.instance;
        await firebaseStorage
            .ref('uploads/${auth.currentUser!.uid}.png')
            .delete();
      }
      i = 0;
    });
  }
}
