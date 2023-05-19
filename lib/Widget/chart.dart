import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

class ChartCustom extends StatefulWidget {
  const ChartCustom({Key? key}) : super(key: key);

  @override
  State<ChartCustom> createState() => _ChartCustomState();
}

class _ChartCustomState extends State<ChartCustom> {
  bool _isDataLabelTapped = false;
  String _selectedYear = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 356.w,
      child: Column(
        children: [
          SfCartesianChart(
            backgroundColor: Color(0xffE2E2E2),
            series: <ColumnSeries<SalesData, String>>[
              ColumnSeries<SalesData, String>(
                dataSource: <SalesData>[
                  SalesData('KOL', 40),
                  SalesData('HR', 15),
                  SalesData('MP', 35),
                  SalesData('UP', 45),
                  SalesData('PUN', 42),
                  SalesData('DEL', 85),
                ],
                xValueMapper: (SalesData sales, _) => sales.year,
                yValueMapper: (SalesData sales, _) => sales.sales,
                dataLabelSettings: DataLabelSettings(
                  isVisible: true,
                  // labelFormat: '{value}%',
                ),
                onPointTap: (pointInteractionDetails) {
                  print(pointInteractionDetails.pointIndex);
                },
                color: Colors.blue,
                borderWidth: 2,
                // onTap: (series, data) {
                //   setState(() {
                //     selectedDataIndex = data.pointIndex; // Update the selected data index
                //   });
                // },
                borderRadius: BorderRadius.circular(10),
                width: 0.5,
              ),
            ],

            primaryXAxis: CategoryAxis(),
            // onDataLabelTapped: (onTapArgs) {
            //   print(onTapArgs.text);
            // },
            primaryYAxis: NumericAxis(
              labelFormat: '{value}%',
            ),
          ),
          if (_isDataLabelTapped)
            Container(
              // width: 150,
              // height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'Year: $_selectedYear',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}


