import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utility/constant.dart';

class LeaderboardTitle extends StatefulWidget {
  const LeaderboardTitle({Key? key}) : super(key: key);

  @override
  State<LeaderboardTitle> createState() => _LeaderboardTitleState();
}

double? dataRowHeight;

class _LeaderboardTitleState extends State<LeaderboardTitle> {
  List<Map<String, dynamic>> data = [
    {'Rank': 6, 'Name': 'Rahul Mishra', 'Points': 236.32, 'Level': 9},
    {'Rank': 5, 'Name': 'Kunal Kalra', 'Points': 2365, 'Level': 4},
    {'Rank': 6, 'Name': 'Rishabh Choudhary', 'Points': 236.32, 'Level': 9},
    {'Rank': 6, 'Name': 'Rahul Mishra', 'Points': 236.32, 'Level': 9},
    {'Rank': 6, 'Name': 'Rahul Mishra', 'Points': 236.32, 'Level': 9},
    {'Rank': 6, 'Name': 'Rahul Mishra', 'Points': 236.32, 'Level': 9},
    {'Rank': 6, 'Name': 'Rahul Mishra', 'Points': 236.32, 'Level': 9},
    {'Rank': 6, 'Name': 'Rahul Mishra', 'Points': 236.32, 'Level': 9},
    {'Rank': 6, 'Name': 'Rahul Mishra', 'Points': 236.32, 'Level': 9},
    {'Rank': 6, 'Name': 'Rahul Mishra', 'Points': 236.32, 'Level': 9},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Table(columnWidths: {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(2),
        2: FlexColumnWidth(1),
        3: FlexColumnWidth(1),
      }, children: [
        TableRow(
            decoration: BoxDecoration(
                color: Color(0xffDC1C29),
                borderRadius: BorderRadius.circular(4.r)),
            children: [
              Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Text(
                    'Rank',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Text(
                    'Name',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Text(
                    'Points',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Text(
                    'Level',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
            ]),
        ...data
            .map((item) => TableRow(
                    decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(4.r)),
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            item['Rank'].toString(),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(item['Name']),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(item['Points'].toString()),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(item['Level'].toString()),
                        ),
                      ),
                    ]))
            .toList()
      ]),
    );

    //
  }
}
