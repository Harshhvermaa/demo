import 'package:demo_video/Homescreen.dart';
import 'package:demo_video/basic_example_page.dart';
import 'package:demo_video/screen/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_meedu_videoplayer/init_meedu_player.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Widget/custom_animation.dart';

void main() async{
  configLoading();
  await initMeeduPlayer();
  runApp(const MyApp());
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false
    ..customAnimation = CustomAnimation();
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 879),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          builder: EasyLoading.init(),
          debugShowCheckedModeBanner: false,
          title: 'Kotak App',
          theme: ThemeData(
            primarySwatch: Colors.red,
            scaffoldBackgroundColor: Colors.grey[200],
          ),
          home: Splash(),
          // home: Live(),
        );
      },
    );

    //   MaterialApp(
    //   home: Splash(),
    // );
  }
}
