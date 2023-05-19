import 'package:fl_chart/fl_chart.dart';
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Constant/app_colors.dart';

class GraphScreen extends StatefulWidget {



  final Color barColor = Color(0xff878787);
  final Color touchedBarColor = Color(0xffDC1C29);



  @override
  State<StatefulWidget> createState() => GraphScreenState();
}

class GraphScreenState extends State<GraphScreen> {
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      height: 201,
      decoration: BoxDecoration(
        color: Color(0xffE2E2E2),
        borderRadius: BorderRadius.circular(4)
      ),

      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(6),
            child: Column(

              children: <Widget>[

                Center(
                  child: Text(
                    'Performance Chart Region Wise (in %)',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,

                    ),
                  ),
                ),

                Expanded(
                  flex: 2,
                  child: BarChart(
                    isPlaying ? randomData() : mainBarData(),
                    swapAnimationCurve: Curves.linear,
                    swapAnimationDuration: animDuration,
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(
      int x,
      double y, {
        bool isTouched = false,
        Color? barColor,
        double width = 18,
        List<int> showTooltips = const [],
      }) {
    barColor ??= widget.barColor;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ? widget.touchedBarColor : barColor,
          width: width,
          borderSide: isTouched
              ? BorderSide(color: widget.touchedBarColor)
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 15,
            color: Color(0xffE2E2E2),
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(6, (i) {
    switch (i) {
      case 0:
        return makeGroupData(0, 40, isTouched: i == touchedIndex);
      case 1:
        return makeGroupData(1, 15, isTouched: i == touchedIndex);
      case 2:
        return makeGroupData(2, 35, isTouched: i == touchedIndex);
      case 3:
        return makeGroupData(3, 45, isTouched: i == touchedIndex);
      case 4:
        return makeGroupData(4, 42, isTouched: i == touchedIndex);
      case 5:
        return makeGroupData(5, 85, isTouched: i == touchedIndex);

      default:
        return throw Error();
    }
  });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.white,
          tooltipHorizontalAlignment: FLHorizontalAlignment.right,
          tooltipMargin: -5,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            String City;
            switch (group.x) {
              case 0:
                City = 'KOLKATA';
                break;
              case 1:
                City = 'HARYANA';
                break;
              case 2:
                City = 'MADHYA PRADESH';
                break;
              case 3:
                City = 'UTTAR PRADESH';
                break;
              case 4:
                City = 'PUNJAB';
                break;
              case 5:
                City = 'DELHI';
                break;

              default:
                throw Error();
            }
            return BarTooltipItem(
              '$City\n',
              const TextStyle(
                color: Color(0xff90121B),
                fontWeight: FontWeight.w300,
                fontSize: 10,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: (rod.toY - 1).toString(),

                  style: TextStyle(
                    color: Color(0xff90121B),
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            );
          },
        ),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 28,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),

      gridData: FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text =  Text('Kol ', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: Colors.black));
        break;
      case 1:
        text =  Text('HR', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: Colors.black));
        break;
      case 2:
        text =  Text('MP', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: Colors.black));
        break;
      case 3:
        text =  Text('UP', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: Colors.black));
        break;
      case 4:
        text =  Text('PUN', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: Colors.black));
        break;
      case 5:
        text =  Text('DEL', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: Colors.black));
        break;

      default:
        text =  Text('', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: Colors.black));
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  BarChartData randomData() {
    return BarChartData(
      barTouchData: BarTouchData(
        enabled: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),

        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: List.generate(6, (i) {
        switch (i) {
          case 0:
            return makeGroupData(
              0,
              Random().nextInt(15).toDouble() + 6,
              barColor: Colors.red,
            );
          case 1:
            return makeGroupData(
              1,
              Random().nextInt(15).toDouble() + 6,
              barColor: Colors.red,
            );
          case 2:
            return makeGroupData(
              2,
              Random().nextInt(15).toDouble() + 6,
              barColor: Colors.red,
            );
          case 3:
            return makeGroupData(
              3,
              Random().nextInt(15).toDouble() + 6,
              barColor: Colors.red,
            );
          case 4:
            return makeGroupData(
              4,
              Random().nextInt(15).toDouble() + 6,
              barColor: Colors.red,
            );
          case 5:
            return makeGroupData(
              5,
              Random().nextInt(15).toDouble() + 6,
              barColor: Colors.red,
            );
          case 6:
            return makeGroupData(
              6,
              Random().nextInt(15).toDouble() + 6,
              barColor: Colors.red,
            );
          default:
            return throw Error();
        }
      }),
      gridData: FlGridData(show: false),
    );
  }

  Future<dynamic> refreshState() async {
    setState(() {});
    await Future<dynamic>.delayed(
      animDuration + const Duration(milliseconds: 50),
    );
    if (isPlaying) {
      await refreshState();
    }
  }
}