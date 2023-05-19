import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utility/constant.dart';

class CustomTable extends StatefulWidget {
  const CustomTable({Key? key}) : super(key: key);

  @override
  State<CustomTable> createState() => _CustomTableState();
}

double? dataRowHeight;

class _CustomTableState extends State<CustomTable> {
  List data = [
    {'Rank': 1, 'Name': 'Rahul Mishra', 'Points': 23656, 'Level': 19},
    {'Rank': 2, 'Name': 'Kunal Kalra', 'Points': 22345, 'Level': 17},
    {'Rank': 3, 'Name': 'Rishabh Choudhary', 'Points': 20023, 'Level': 17},
    {'Rank': 4, 'Name': 'Sonali Mishra', 'Points': 15676, 'Level': 14},
    {'Rank': 5, 'Name': 'Kunadan Kumar', 'Points': 12568, 'Level': 15},
    {'Rank': 6, 'Name': 'Ajay Sharma', 'Points': 10230, 'Level': 11},
    {'Rank': 7, 'Name': 'Abhinav Kumar', 'Points': 8764, 'Level': 9},
    {'Rank': 8, 'Name': 'Bala Rani', 'Points': 6789, 'Level': 9},
    {'Rank': 9, 'Name': 'Himanshu', 'Points': 4592, 'Level': 7},
    {'Rank': 10, 'Name': 'Anwesa Sen', 'Points': 2363, 'Level': 5},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xffDC1C29),
                borderRadius: BorderRadius.circular(4.r)),
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
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
                    padding: const EdgeInsets.only(right: 0),
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
                    padding: const EdgeInsets.only(left: 0),
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
                    padding: const EdgeInsets.only(right: 16),
                    child: Text(
                      'Level',
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 400.h,
            child: ListView.separated(
                itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(4.r)),
                      width: double.infinity,
                      child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 35.w,
                                  child: Text(
                                    data[index]["Rank"].toString(),
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 1.0),
                                child: Container(
                                    width: 130.w,
                                    child: Text(
                                      data[index]["Name"],
                                    )),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 55.w,
                                  child: Text(
                                    data[index]["Points"].toString(),
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 34),
                                child: Container(
                                  width: 35.w,
                                  child: Text(
                                    data[index]["Level"].toString(),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 10.h,
                    ),
                itemCount: 10),
          ),
        ),
      ],
    );
    //
  }
}
