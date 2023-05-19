import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui';
import 'package:demo_video/utility/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:demo_video/utility/app_colors.dart';

double SCREEN_WIDTH(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double SCREEN_HEIGHT(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

LinearGradient gradientTheme() {
  return LinearGradient(
      colors: [
        const Color(0xff8C121A),
        const Color(0xffF31E2D),
      ],
      begin: const FractionalOffset(0.0, 0.0),
      end: const FractionalOffset(1.0, 0.0),
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp);
}

TextStyle SET_FONT_STYLE(
    double fontSize, FontWeight fontWeight, Color fontColor,
    {TextField_height, lineheight}) {
  return GoogleFonts.inter(
      color: fontColor,
      // fontFamily: FONT_FAMILY,
      fontSize: fontSize,
      height: TextField_height,
      fontWeight: fontWeight);
}

Column app_footer() {
  return Column(
    children: [
      Row(
        children: [
          Text("For Support  Call us on"),
          Text(
            "1800 572 9855",
            style: SET_FONT_STYLE(14.sp, FontWeight.w500, Colors.red),
          )
        ],
      ),
      Row(
        children: [
          Text(
            "Made with",
            style: SET_FONT_STYLE(14.sp, FontWeight.w400, Colors.black),
          ),
          Text(
            "1800 572 9855",
            style: SET_FONT_STYLE(14.sp, FontWeight.w500, Colors.red),
          )
        ],
      )
    ],
  );
}

List<Color> gradiantBlue = [
  Color(0xff8C121A),
  Color(0xffF31E2D),
];



showMessageDialog(String message, bool success, BuildContext context,
    [bool isDoublePopup = false, buttonText = "DONE"]) {
  late Color snackbarColor;
  if (success) {
    snackbarColor = Colors.green;
  } else {
    snackbarColor = Colors.red;
  }

  Widget doneButton = ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      // fixedSize: Size(isMobile(context) ? 150.w : 100, 40.h),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    ),
    child: Text(
      buttonText,
      style: SET_FONT_STYLE(18.sp, FontWeight.w600, AppColors.whiteColor),
    ),
    onPressed: () {
        Navigator.pop(context);
      }
  // );
      );
  return showDialog(
      context: context,
      // barrierDismissible: (buttonText == "RETRY" &&
      //     (context.read<InternetCubit>().state is InternetConnected)),
      builder: (BuildContext context) {
        print("----------------------show message popup--------------------");
        return StatefulBuilder(
          builder: (context, setState2) {
            return Container(
              child: AlertDialog(
                backgroundColor: Colors.red,
                elevation: 100.0,
                title: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                  // decoration: BoxDecoration(
                  //     gradient: LinearGradient(
                  //   begin: Alignment.topLeft,
                  //   end: Alignment.topRight,
                  //   colors: [AppColors.greyColor],
                  // )),
                  child: Center(
                    child: Image.asset("images/KotakLogo.png",
                        height: 80.h, fit: BoxFit.contain),
                  ),
                ),
                actions: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: doneButton,
                      ),
                      // continueButton
                    ],
                  ),
                ],
                content: Padding(
                  padding: EdgeInsets.only(
                      left: 30.w, right: 30.w, top: 20.h, bottom: 10.h),
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: SET_FONT_STYLE(
                        20.sp, FontWeight.normal, AppColors.blackColor),
                  ),
                ),
              ),
            );
          },
        );
      });
}
showSnackbar(String message, bool success, BuildContext context) {
  late Color snackbarColor;
  if (success) {
    snackbarColor = Colors.green;
  } else {
    snackbarColor = Colors.red;
  }

  Widget doneButton = ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      fixedSize: Size(150, 40),
      // minimumSize: Size(300, 50),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    ),
    child: Text(
      'DONE',
      style: SET_FONT_STYLE(18, FontWeight.w600, AppColors.whiteColor),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState2) {
            return AlertDialog(
              backgroundColor: AppColors.whiteColor,
              elevation: 100.0,
              title: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: gradiantBlue,
                )),
                child: Image.asset("assets/images/logo.png",
                    height: 80, fit: BoxFit.contain),
              ),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: doneButton,
                    ),
                    // continueButton
                  ],
                ),
              ],
              content: Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 20, bottom: 10),
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: SET_FONT_STYLE(
                      20, FontWeight.normal, AppColors.blackColor),
                ),
              ),
            );
          },
        );
      });

  // final snackBar =
  //     SnackBar(backgroundColor: snackbarColor, content: Text(message));
  // ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

bool isValidPhoneNumber(String string) {
  // Null or empty string is invalid phone number
  if (string.isEmpty) {
    return false;
  }
  // You may need to change this pattern to fit your requirement.
  // I just copied the pattern from here: https://regexr.com/3c53v
  const pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
  final regExp = RegExp(pattern);

  if (!regExp.hasMatch(string)) {
    return false;
  }
  return true;
}


void showSnakeBar(String message, BuildContext context, bool status) {
  var snackBar = SnackBar(
    content: Text(message),
    backgroundColor: status ? Colors.green : Colors.red,
  );

  ScaffoldMessenger.of(context).showSnackBar(
    snackBar,
  );
}