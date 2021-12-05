import 'package:flutter/material.dart';
import 'package:widuri/colors.dart';

class Notif extends StatelessWidget {
  const Notif({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios_new_rounded),
                    iconSize: 20.0,
                  ),
                  Text(
                    'Pemberitahuan',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Baca Semua',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 13.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.blue),
                    ),
                  )
                ],
              ),
              Container(
                child: Column(
                  children: [
                    Divider(),
                    SizedBox(
                      height: 10.0,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.all(0.0),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://www.trendrr.net/wp-content/uploads/2017/06/Deepika-Padukone-1.jpg'),
                      ),
                      title: Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Festival Tanaman',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            Text(
                              'Festival tanaman sedang dimulai di malang, jangan lupa untuk berangkat ke tempat festival ya!',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.normal,
                                  color: greyTextColor),
                            )
                          ],
                        ),
                      ),
                      trailing: Text(
                        '2 menit yang lalu',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 13.0,
                            fontWeight: FontWeight.normal,
                            color: greyTextColor),
                      ),
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
                        backgroundImage: NetworkImage(
                            'https://www.trendrr.net/wp-content/uploads/2017/06/Deepika-Padukone-1.jpg'),
                      ),
                      title: Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Festival Tanaman',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            Text(
                              'Festival tanaman sedang dimulai di malang, jangan lupa untuk berangkat ke tempat festival ya!',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.normal,
                                  color: greyTextColor),
                            )
                          ],
                        ),
                      ),
                      trailing: Text(
                        '2 menit yang lalu',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 13.0,
                            fontWeight: FontWeight.normal,
                            color: greyTextColor),
                      ),
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
                        backgroundImage: NetworkImage(
                            'https://www.trendrr.net/wp-content/uploads/2017/06/Deepika-Padukone-1.jpg'),
                      ),
                      title: Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Festival Tanaman',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            Text(
                              'Festival tanaman sedang dimulai di malang, jangan lupa untuk berangkat ke tempat festival ya!',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.normal,
                                  color: greyTextColor),
                            )
                          ],
                        ),
                      ),
                      trailing: Text(
                        '2 menit yang lalu',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 13.0,
                            fontWeight: FontWeight.normal,
                            color: greyTextColor),
                      ),
                    ),
                  ],
                ),
              ),
            ])));
  }
}
