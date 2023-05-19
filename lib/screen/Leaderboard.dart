import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:demo_video/Constant/AppConstants.dart';
import 'package:demo_video/Widget/CustomAppbar.dart';
import 'package:demo_video/Widget/Table.dart';
import 'package:demo_video/Widget/questionBox.dart';
import 'package:demo_video/screen/LiveEventScreen.dart';
import 'package:demo_video/screen/reward.dart';
import 'package:demo_video/screen/select_language.dart';
import 'package:video_player/video_player.dart';
import '../Widget/GraphScreen.dart';
import '../Constant/app_colors.dart';

// import '../Widget/Leaderboard_Title.dart';
import '../Widget/Leaderboard_Title.dart';
import '../Widget/customFooter.dart';
import '../utility/constant.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({Key? key}) : super(key: key);

  @override
  State<Leaderboard> createState() => _Leaderboard();
}

class _Leaderboard extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: gradiantBlue,
                  ),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                ),
                padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
                height: 60.h,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LiveEventScreen(),
                              ),
                            );
                          },
                          child: Container(
                            child: Icon(
                              Icons.keyboard_arrow_left_rounded,
                              color: Colors.white,
                              size: 40.w,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          "Leaderboard",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 18.0.w),
                      child: Image(
                        image: AssetImage("assets/images/KotakLogo.png"),
                        fit: BoxFit.cover,
                        height: 30.h,
                        // width: 150.w,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              GraphScreen(),

              Divider(color: Color(0xffCECECE), thickness: 1),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 0.h, top: 8.h),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.r),
                                color: Colors.white,
                                border: Border.all(
                                    width: 1, color: Color(0xffE0E0E0)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image(
                                      image:
                                          AssetImage("assets/images/user1.png"),
                                      fit: BoxFit.cover,
                                      height: 52.h,
                                      width: 102.w,
                                    ),
                                    Text(
                                      "Pamela Salena",
                                      style: TextStyle(
                                          fontSize: 9,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      "50.78 Pts",
                                      style: TextStyle(
                                          fontSize: 7,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff747474)),
                                    ),
                                    Text(
                                      "Level 8",
                                      style: TextStyle(
                                          fontSize: 7,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xffDC1C29)),
                                    ),
                                  ],
                                ),
                              ),
                              width: 112.w,
                              height: 122.h,
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: Color(0xffDC1C29),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                constraints: BoxConstraints(
                                  minWidth: 16,
                                  minHeight: 16,
                                ),
                                child: Text(
                                  '3',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 0.h, top: 8.h),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r),
                            color: Colors.white,
                            border:
                                Border.all(width: 1, color: Color(0xffE0E0E0)),
                          ),
                          width: 112.w,
                          height: 122.h,
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image(
                                  image: AssetImage("assets/images/user2.png"),
                                  fit: BoxFit.cover,
                                  height: 52.h,
                                  width: 102.w,
                                ),
                                Text(
                                  "Rahul Mishra",
                                  style: TextStyle(
                                      fontSize: 9,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                Text(
                                  "50.78 Pts",
                                  style: TextStyle(
                                      fontSize: 7,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff747474)),
                                ),
                                Text(
                                  "Level 8",
                                  style: TextStyle(
                                      fontSize: 7,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffDC1C29)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: -1,
                        right: -1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Color(0xffDC1C29),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            constraints: BoxConstraints(
                              minWidth: 16,
                              minHeight: 16,
                            ),
                            child: Text(
                              '1',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 0.h, top: 8.h),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.r),
                                color: Colors.white,
                                border: Border.all(
                                    width: 1, color: Color(0xffE0E0E0)),
                              ),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              "assets/images/user3.png"),
                                          fit: BoxFit.cover,
                                          height: 52.h,
                                          width: 102.w,
                                        ),
                                        Text(
                                          "Kunal Kalra",
                                          style: TextStyle(
                                              fontSize: 9,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          "50.78 Pts",
                                          style: TextStyle(
                                              fontSize: 7,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff747474)),
                                        ),
                                        Text(
                                          "Level 8",
                                          style: TextStyle(
                                              fontSize: 7,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xffDC1C29)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              width: 112.w,
                              height: 122.h,
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: Color(0xffDC1C29),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                constraints: BoxConstraints(
                                  minWidth: 16,
                                  minHeight: 16,
                                ),
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 19),
                  child: Text(
                    "Popular in Delhi",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              // LeaderboardTitle(),
              CustomTable()
            ],
          ),
        ),
      ),
      Container(
        height: 67.h,
        width: 395.w,
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Row(
          children: [
            Padding(padding: EdgeInsets.all(10)),
            Image(
              image: AssetImage("assets/images/logo.png"),
              fit: BoxFit.cover,
              height: 31.h,
              width: 122.w,
            ),
            SizedBox(
              width: 60.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      "Terms & Conditions",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "    |    ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Privacy Policy",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Copyright 2023 Almond Solutions",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                      fontWeight: FontWeight.w400),
                ),
              ],
            )
          ],
        ),
      ),
    ]));
  }
}
