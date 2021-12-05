import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widuri/colors.dart';
import 'package:widuri/controller/c_user.dart';
import 'package:widuri/gambar.dart';

Widget profilImage() {
  if (kIsWeb) {
    return CircleAvatar(
      backgroundImage: AssetImage(me),
      backgroundColor: backgroundColor,
      radius: 25.0,
    );
  } else {
    return Obx(() => CircleAvatar(
          backgroundImage: AssetImage(me),
          backgroundColor: backgroundColor,
          radius: 25.0,
          child: ClipOval(
            child: Visibility(
              visible: UserController.photoUrl.value != "",
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  UserController.photoUrl.value,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes as int)
                            : null,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ));
  }
}
