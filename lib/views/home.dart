import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:widuri/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'Widget/card_barang.dart';

class Home extends StatefulWidget {
  final String email;
  const Home(this.email, {Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState(email);
}

class _HomeState extends State<Home> {
  String email;
  static const List<String> _list = ['Harian', 'Mingguan', 'Bulanan'];

  String _value = _list.first;

  _HomeState(this.email);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Hi, $email!",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(onPressed: null, icon: Icon(Icons.notifications))
          ],
        ),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints viewport) {
              var h = MediaQuery.of(context).size.height;
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: viewport.maxHeight,),
              child: IntrinsicHeight(
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        child: new ListTile(
                          leading: new Icon(Icons.search),
                          title: new TextField(
                            decoration: new InputDecoration(
                                hintText: 'Search', border: InputBorder.none),
                            // onChanged: onSearchTextChanged,
                          ),
                          trailing: new IconButton(
                            icon: new Icon(Icons.filter_list_rounded),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.all(12),
                          child: Text(
                            'Stock Barang Menipis',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'RobotoMono',
                                color: Colors.black),
                          )),
                      Stack(
                        children: <Widget>[
                          SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                CardBarang(
                                  namaBarang: 'Hijab Segitiga',
                                  idBarang: 'Hij-001',
                                  jumlah: 5,
                                  harga: 10000,
                                ),
                                SizedBox(height: 12.0),
                                CardBarang(
                                  namaBarang: 'Hijab kotak',
                                  idBarang: 'Hij-002',
                                  jumlah: 5,
                                  harga: 10000,
                                ),
                                SizedBox(height: 12.0),
                                CardBarang(
                                  namaBarang: 'Hijab Langsung',
                                  idBarang: 'Hij-003',
                                  jumlah: 10,
                                  harga: 15000,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.all(12),
                          child: Text(
                            'Tren Penjualan',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'RobotoMono',
                                color: Colors.black),
                          )),
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 1.5,
                          child: Card(
                            elevation: 6,
                            child: Column(
                              children: <Widget>[
                                const SizedBox(
                                  height: 12,
                                ),
                                SizedBox(
                                  width: w * 0.3,
                                  child: DropdownButtonFormField<String>(
                                    value: _value,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                    iconSize: 24,
                                    elevation: 16,
                                    style: TextStyle(color: Colors.black),
                                    onChanged: (var newValue) =>
                                        setState(() => _value = newValue!),
                                    items: _list
                                        .map((String item) =>
                                            DropdownMenuItem<String>(
                                                child: Text(item), value: item))
                                        .toList(),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 16.0, left: 6.0),
                                    child: LineChart(
                                      sampleData1(),
                                      swapAnimationDuration:
                                          const Duration(milliseconds: 250),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }

  LineChartData sampleData1() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
            getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
              return touchedBarSpots.map((barSpot) {
                final flSpot = barSpot;
                if (flSpot.x == 0 || flSpot.x == 8) {
                  return null;
                }

                return LineTooltipItem(
                  'Rp',
                  const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: flSpot.y.toString(),
                      style: TextStyle(
                        color: Colors.grey[100],
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ],
                );
              }).toList();
            }),
        touchCallback: (LineTouchResponse touchResponse) {},
        handleBuiltInTouches: true,
      ),
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 40,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff72719b),
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            fontSize: 12,
          ),
          rotateAngle: 45,
          margin: 10,
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '21 JAN';
              case 2:
                return '22 JAN';
              case 3:
                return '23 JAN';
              case 4:
                return '24 JAN';
              case 5:
                return '25 JAN';
              case 6:
                return '26 JAN';
              case 7:
                return '27 JAN';
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff75729e),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 100:
                return '10k';
              case 200:
                return '20k';
              case 300:
                return '30k';
              case 400:
                return '40k';
            }
            return '';
          },
          margin: 8,
          reservedSize: 30,
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(
            color: Color(0xffEE6B61),
            width: 4,
          ),
          left: BorderSide(
            color: Color(0xffEE6B61),
            width: 4,
          ),
          right: BorderSide(
            color: Colors.transparent,
          ),
          top: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      minX: 0,
      maxX: 8,
      maxY: 400,
      minY: 0,
      lineBarsData: linesBarData1(),
    );
  }

  List<LineChartBarData> linesBarData1() {
    final lineChartBarData1 = LineChartBarData(
      spots: [
        FlSpot(1, 100),
        FlSpot(2, 100.5),
        FlSpot(3, 100.4),
        FlSpot(4, 300.4),
        FlSpot(5, 200),
        FlSpot(6, 200.2),
        FlSpot(7, 100.8),
      ],
      isCurved: true,
      colors: [
        const Color(0xffEE6B61),
      ],
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: true,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );
    return [
      lineChartBarData1,
    ];
  }
}
