import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:demo_video/Widget/CustomAppbar.dart';
import 'package:demo_video/screen/Leaderboard.dart';
import 'package:demo_video/screen/login_screen.dart';
import 'package:demo_video/screen/select_language.dart';
import 'package:demo_video/utility/constant.dart';

class RewardScreen extends StatefulWidget {

  @override
  State<RewardScreen> createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: gradiantBlue,
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
              ),
              padding: EdgeInsets.only(bottom: 20.h),
              height: 109.h,
              width: 395.w,
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) => SelectLanguage()) );
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
                        width: 10.w,
                      ),
                      Text(
                        "Your Rewards",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "150250",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          Text(
                            "Current Points",
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Image(
                        image: AssetImage("assets/images/star.png"),
                        fit: BoxFit.fill,
                        height: 30.h,
                        width: 30.w,
                      ),
                      SizedBox(
                        width: 10.w,
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.all(14),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/rewards.png"),
                            fit: BoxFit.fill)),
                  ),
                  Positioned(
                    bottom: 90.h,left: 55.w,
                    child: SizedBox(
                      width: 282.w,
                      height: 48.h,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) => LoginScreen()) );
                        },
                        child: Text(
                          'Congratulations',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
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
                    fit: BoxFit.fill,
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
                      SizedBox(height: 5.h,),
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
          ],
        ));
  }
}
