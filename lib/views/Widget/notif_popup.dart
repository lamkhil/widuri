import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../colors.dart';
import '../../gambar.dart';
import '../notif_screen.dart';

Future<dynamic> NotifBuildShowDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        var w = MediaQuery.of(context).size.width;
        return AlertDialog(
            scrollable: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pemberitahuan',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                TextButton(onPressed: (){
                  Get.off(Notif());
                }, child: Text(
                  'Lihat semua',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 13.0,
                      fontWeight: FontWeight.w300,
                      color: pressBlueText),
                ),)
              ],
            ),
          content: Container(
            padding: EdgeInsets.only(
              top: 0.0
            ),
                child: Column(
              children: [
                Divider(),
                SizedBox(
                  height: 10.0,
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(0.0),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(me),
                    ),
                    title: Expanded(
                      child : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Festival Tanaman',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),),
                          Text('Festival tanaman sedang dimulai di malang, jangan lupa untuk berangkat ke tempat festival ya!',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 13.0,
                                fontWeight: FontWeight.normal,
                                color: greyTextColor),)
                        ],
                      ),
                    ),
                    trailing: Text('2 menit yang lalu',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 13.0,
                          fontWeight: FontWeight.normal,
                          color: greyTextColor),),
                  ),
                SizedBox(
                  height: 10.0,
                ),
                Divider(),
                SizedBox(
                  height: 10.0,
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(0.0),
                  leading: CircleAvatar(
                      backgroundImage: AssetImage(me),
                  ),
                  title: Expanded(
                    child : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Festival Tanaman',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),),
                        Text('Festival tanaman sedang dimulai di malang, jangan lupa untuk berangkat ke tempat festival ya!',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 13.0,
                              fontWeight: FontWeight.normal,
                              color: greyTextColor),)
                      ],
                    ),
                  ),
                  trailing: Text('2 menit yang lalu',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 13.0,
                        fontWeight: FontWeight.normal,
                        color: greyTextColor),),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Divider(),
                SizedBox(
                  height: 10.0,
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(0.0),
                  leading: CircleAvatar(
                      backgroundImage: AssetImage(me),
                  ),
                  title: Expanded(
                    child : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Festival Tanaman',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),),
                        Text('Festival tanaman sedang dimulai di malang, jangan lupa untuk berangkat ke tempat festival ya!',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 13.0,
                              fontWeight: FontWeight.normal,
                              color: greyTextColor),)
                      ],
                    ),
                  ),
                  trailing: Text('2 menit yang lalu',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 13.0,
                        fontWeight: FontWeight.normal,
                        color: greyTextColor),),
                ),


            ],
          ),
          ),

        );
      });
}
