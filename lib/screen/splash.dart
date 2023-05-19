import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:demo_video/screen/home.dart';
import 'package:demo_video/screen/login_screen.dart';
import 'package:demo_video/screen/select_language.dart';
import 'package:demo_video/utility/app_colors.dart';

class Splash extends StatefulWidget {

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SelectLanguage()) ) );
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppColors.linear_gradient),
      child: Center(
        child: SizedBox(
            height: 69.h,
            width: 266.w,
            child: Image.asset("assets/images/logo.png")),
      ),
    );
  }
}
