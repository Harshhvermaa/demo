import 'dart:async';
import 'package:demo_video/screen/TestLiveEventScreenAsset.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:demo_video/model/login_model.dart';
import 'package:demo_video/screen/LiveEventScreen.dart';
import 'package:demo_video/screen/TestLiveEventScreen.dart';
import 'package:demo_video/webservices/web_services.dart';
import 'package:pinput/pinput.dart';
import '../Widget/support.dart';
import '../basic_example_page.dart';
import '../utility/constant.dart';
import '../webservices/api_exception.dart';

class OTPScreen extends StatefulWidget {
  String mobile;
  OTPScreen({Key? key, required this.mobile}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  String verificationCode = "";
  Timer? _timer;
  int _start = 30;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: gradiantBlue,
            )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 68.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 19.w),
                  child: Image.asset(
                    "assets/images/KotakLogo.png",
                    width: 150.w,
                    height: 100.h,

                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 19.w),
                  child: Text(
                    "OTP Code",
                    style: SET_FONT_STYLE(30.sp, FontWeight.w600, Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 19.w),
                  child: Text(
                    "Enter the 6-digit code sent to Mobile",
                    style: SET_FONT_STYLE(14.sp, FontWeight.w400, Colors.white),
                  ),
                ),
                SizedBox(
                  height: 43.h,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 43.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Pinput(
              length: 6,
              defaultPinTheme: PinTheme(
                width: 80,
                height: 60.h,
                textStyle: SET_FONT_STYLE(30, FontWeight.normal, Colors.black),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 2.r,
                    ),
                  ],
                ),
              ),
              // onCompleted: (pin) {
              //   verificationCode = pin;
              //   verifyOTP();
              // },
              onChanged: (str) {
                verificationCode = str;
              },
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          InkWell(
            onTap: _start == 0
                ? () {
                    _start = 30;
                    setState(() {

                    });
                    resendOtp();
                  }
                : null,
            child: Text(
              _start == 0 ? "Resend OTP" : "Did't get OTP ? Resend in $_start",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: 80.h,
          ),
          InkWell(
            onTap: () {
              verifyOTP();
            },
            child: Container(
              width: 354.w,
              height: 54.h,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: gradiantBlue,
                  ),
                  border: Border.all(
                      color: Color(0xffE3E3E3),
                      width: 1.0,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(6.r)),
              child: Center(
                  child: Text(
                "Verify OTP",
                style: SET_FONT_STYLE(18.sp, FontWeight.w500, Colors.white),
              )),
            ),
          ),
          Spacer(),
          SupportWidget(),
          SizedBox(
            height: 52.h,
          ),
        ],
      ),
    );
  }

  void verifyOTP() {
    if (verificationCode == "") {
      showSnackbar("Please enter verification code", false, context);
    } else if (verificationCode.length != 6) {
      showSnackbar("Verification code must have 6 digits", false, context);
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                TestLiveEventScreenAsset(),
          ),
      );
      // LoginModel data;
      // LoginServices()
      //     .verifyOtp(int.parse(widget.mobile), int.parse(verificationCode))
      //     .then((value) async {
      //   if ( value.success == true || verificationCode == "000000" ) {
      //     Navigator.pushReplacement(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) =>
      //               LiveEventScreen(),
      //     ));
      //   } else {
      //     showSnackbar(value.message!, false, context);
      //   }
      // }).catchError((error) {
      //   if (error is ApiNotRespondingException) {
      //     EasyLoading.dismiss();
      //     showSnakeBar(error.message ?? "", context, false);
      //   } else if (error is FetchDataException) {
      //     EasyLoading.dismiss();
      //     showSnakeBar(error.message ?? "", context, false);
      //   }
      // });
    }
  }

  void resendOtp() {
    LoginModel data;
    LoginServices().loginUser(widget.mobile).then((value) async {
      if (value.success == true) {
        startTimer();
        showSnakeBar(value.message ?? "", context, true);
      } else {
        showSnackbar(value.message!, false, context);
      }
    }).catchError((error) {
      if (error is ApiNotRespondingException) {
        EasyLoading.dismiss();
        showSnakeBar(error.message ?? "", context, false);
      } else if (error is FetchDataException) {
        EasyLoading.dismiss();
        showSnakeBar(error.message ?? "", context, false);
      }
    });
  }
}
