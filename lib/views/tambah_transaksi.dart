import 'package:flutter/material.dart';

class tambah_transaksi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Column(
          children: <Widget>[
            new Padding(padding: new EdgeInsets.all(20.0)),
            new Text("ada", style : new TextStyle(fontSize: 29.0),),
            new Padding(padding: new EdgeInsets.all(20.0)),
            new Icon(Icons.add_task, size: 90.0,)
          ],
        ),
      ),
    );
  }
}