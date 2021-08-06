import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:widuri/controller/c_transaksi.dart';

import '../../colors.dart';

Widget grafik() {
  C_Transaksi transaksiController =
      C_Transaksi().initialized ? Get.find() : Get.put(C_Transaksi());
  return Obx(() {
    var data = transaksiController.dataGrafik.value;
    print(data);
    if (transaksiController.dataGrafik.isEmpty) {
      return SpinKitFadingCube(color: primaryColor);
    } else {
      return LineChart(
        LineChartData(
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
                      'Rp ',
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
                for (var i = 1; i <= 7; i++) {
                  if (value == i) {
                    return data['bottomTiles'][i - 1];
                  }
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
                for (var i = 0; i < 4; i++) {
                  if (value.toInt() == data['leftTiles'][i]) {
                    var left = data['leftTiles'][i];
                    var pembilang = left.toString().length > 6 ? 1000000 : 1000;
                    var penyebut =
                        pembilang.toString() == 1000.toString() ? "K" : "Jt";
                    var sederhana = left / pembilang;
                    var split = sederhana.toString().split('.');
                    var result = split.length > 1
                        ? (split[1] == '0' ? split[0] : sederhana.toString())
                        : sederhana.toString();
                    return result + penyebut;
                  }
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
          maxY: data['leftTiles'][0].toDouble(),
          minY: 0,
          lineBarsData: [
            LineChartBarData(
              spots: List.generate(7,
                  (i) => FlSpot(i.toDouble() + 1, data['laba'][i].toDouble())),
              isCurved: false,
              colors: [
                orange,
                primaryColor,
              ],
              barWidth: 4,
              isStrokeCapRound: true,
              dotData: FlDotData(
                show: true,
              ),
              belowBarData: BarAreaData(
                show: true,
              ),
            ),
          ],
        ),
        swapAnimationDuration: const Duration(milliseconds: 250),
      );
    }
  });
}

// LineChartData sampleData1() {
//   return LineChartData(
//     lineTouchData: LineTouchData(
//       touchTooltipData: LineTouchTooltipData(
//           tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
//           getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
//             return touchedBarSpots.map((barSpot) {
//               final flSpot = barSpot;
//               if (flSpot.x == 0 || flSpot.x == 8) {
//                 return null;
//               }

//               return LineTooltipItem(
//                 'Rp',
//                 const TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 children: [
//                   TextSpan(
//                     text: flSpot.y.toString(),
//                     style: TextStyle(
//                       color: Colors.grey[100],
//                       fontWeight: FontWeight.normal,
//                     ),
//                   )
//                 ],
//               );
//             }).toList();
//           }),
//       touchCallback: (LineTouchResponse touchResponse) {},
//       handleBuiltInTouches: true,
//     ),
//     gridData: FlGridData(
//       show: false,
//     ),
//     titlesData: FlTitlesData(
//       bottomTitles: SideTitles(
//         showTitles: true,
//         reservedSize: 40,
//         getTextStyles: (value) => const TextStyle(
//           color: Color(0xff72719b),
//           fontWeight: FontWeight.bold,
//           fontFamily: 'Roboto',
//           fontSize: 12,
//         ),
//         rotateAngle: 45,
//         margin: 10,
//         getTitles: (value) {
//           switch (value.toInt()) {
//             case 1:
//               return '21 JAN';
//             case 2:
//               return '22 JAN';
//             case 3:
//               return '23 JAN';
//             case 4:
//               return '24 JAN';
//             case 5:
//               return '25 JAN';
//             case 6:
//               return '26 JAN';
//             case 7:
//               return '27 JAN';
//           }
//           return '';
//         },
//       ),
//       leftTitles: SideTitles(
//         showTitles: true,
//         getTextStyles: (value) => const TextStyle(
//           color: Color(0xff75729e),
//           fontWeight: FontWeight.bold,
//           fontSize: 14,
//         ),
//         getTitles: (value) {
//           switch (value.toInt()) {
//             case 100:
//               return '10k';
//             case 200:
//               return '20k';
//             case 300:
//               return '30k';
//             case 400:
//               return '40k';
//           }
//           return '';
//         },
//         margin: 8,
//         reservedSize: 30,
//       ),
//     ),
//     borderData: FlBorderData(
//       show: true,
//       border: const Border(
//         bottom: BorderSide(
//           color: Color(0xffEE6B61),
//           width: 4,
//         ),
//         left: BorderSide(
//           color: Color(0xffEE6B61),
//           width: 4,
//         ),
//         right: BorderSide(
//           color: Colors.transparent,
//         ),
//         top: BorderSide(
//           color: Colors.transparent,
//         ),
//       ),
//     ),
//     minX: 0,
//     maxX: 8,
//     maxY: 400,
//     minY: 0,
//     lineBarsData: [
//       LineChartBarData(
//         spots: [
//           FlSpot(1, 100),
//           FlSpot(2, 100.5),
//           FlSpot(3, 100.4),
//           FlSpot(4, 300.4),
//           FlSpot(5, 200),
//           FlSpot(6, 200.2),
//           FlSpot(7, 100.8),
//         ],
//         isCurved: true,
//         colors: [
//           const Color(0xffEE6B61),
//         ],
//         barWidth: 4,
//         isStrokeCapRound: true,
//         dotData: FlDotData(
//           show: true,
//         ),
//         belowBarData: BarAreaData(
//           show: false,
//         ),
//       )
//     ],
//   );
// }

// List<LineChartBarData> linesBarData1() {
//   final lineChartBarData1 = LineChartBarData(
//     spots: [
//       FlSpot(1, 100),
//       FlSpot(2, 100.5),
//       FlSpot(3, 100.4),
//       FlSpot(4, 300.4),
//       FlSpot(5, 200),
//       FlSpot(6, 200.2),
//       FlSpot(7, 100.8),
//     ],
//     isCurved: true,
//     colors: [
//       const Color(0xffEE6B61),
//     ],
//     barWidth: 4,
//     isStrokeCapRound: true,
//     dotData: FlDotData(
//       show: true,
//     ),
//     belowBarData: BarAreaData(
//       show: false,
//     ),
//   );
//   return [
//     lineChartBarData1,
//   ];
// }
