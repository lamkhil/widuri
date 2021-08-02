import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../gambar.dart';
import './profile_nama.dart' as ProfilNama;
import './profile_setting.dart' as ProfilSetting;
import '../colors.dart';

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
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    var name = auth.currentUser!.displayName == null
        ? ''
        : auth.currentUser!.displayName;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: primaryColor,
        title: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Profil',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Card(
                  color: backgroundColor,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 40.0),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.logout_rounded,
                      color: primaryColor,
                    ),
                  ),
                ),
              ],
            )),
      ),
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Column(
              children: [
                Container(
                  height: h * 0.15,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50.0),
                        bottomLeft: Radius.circular(50.0),
                      )),
                ),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.fromLTRB(20, 60, 20, 20),
                        color: backgroundColor,
                        child: Column(
                          children: [
                            Text(
                              '$name',
                              style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            Text(
                              'id : ${auth.currentUser!.uid}',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black38),
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
                top: (h * 0.15) - (100 / 2),
                child: Container(
                    height: 100.0,
                    width: 100.0,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(me),
                      radius: 25.0,
                    )))
          ],
        ),
      ),
    );
  }
}
