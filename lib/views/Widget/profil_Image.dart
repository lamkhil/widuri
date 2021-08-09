import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:widuri/colors.dart';
import 'package:widuri/controller/c_user.dart';
import 'package:widuri/gambar.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

Widget profilImage() {
  if (kIsWeb) {
    return CircleAvatar(
      backgroundImage: AssetImage(me),
      backgroundColor: backgroundColor,
      radius: 25.0,
    );
  } else {
    return Obx(() => CircleAvatar(
          backgroundImage: C_User.photoUrl.value == ""
              ? AssetImage(me)
              : NetworkImage(
                  C_User.photoUrl.value,
                ) as ImageProvider,
          backgroundColor: backgroundColor,
          radius: 25.0,
          child: Visibility(
              visible: C_User.photoUrl.value == "",
              child: SpinKitFadingCube(
                color: primaryColor,
              )),
        ));
  }
}
