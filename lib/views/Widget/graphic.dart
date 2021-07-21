import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

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
