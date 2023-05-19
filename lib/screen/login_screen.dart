import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:demo_video/screen/otp.dart';
import 'package:demo_video/screen/terms_and_cond.dart';
import 'package:demo_video/utility/app_colors.dart';
import 'package:demo_video/webservices/web_services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Widget/custom_button.dart';
import '../Widget/inputtext_field.dart';
import '../Widget/support.dart';
import '../model/login_model.dart';
import '../utility/constant.dart';
import '../webservices/api_exception.dart';

class LoginScreen extends StatefulWidget {
  // static const String route = '/login';
  bool isMobile = false;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _checkBox = false;

  var numberController = TextEditingController();
  String webMobileNumber = "";
  TextEditingController _searchTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // var data = context.watch<HccbProvider>();

    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    // loginProvider loginProvider = Provider.of(context,listen:false);
    return WillPopScope(
        onWillPop: () async => !Navigator.of(context).userGestureInProgress,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
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
                            height: 30.h,
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
                            height: 20.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 19.w),
                            child: Text(
                              "Proceed with your",
                              style: SET_FONT_STYLE(
                                  20.sp, FontWeight.w400, AppColors.whiteColor),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 19.w),
                            child: Text(
                              "Login",
                              style: SET_FONT_STYLE(
                                  40.sp, FontWeight.w700, AppColors.whiteColor),
                            ),
                          ),
                          SizedBox(
                            height: 43.h,
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 30.h),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: numberController,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                              FilteringTextInputFormatter.deny(RegExp(r'\s')),
                              FilteringTextInputFormatter.allow(RegExp(
                                  r'^[+]*[(]{0,1}[6-9]{1,4}[)]{0,1}[-\s\./0-9]*$')),
                            ],
                            cursorColor: AppColors.primaryColor,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              fillColor: AppColors.whiteColor,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 24.w, vertical: 8.h),
                              hintText: "Mobile No.",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.greyColor.withOpacity(0.2),
                                  width: 1.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.greyColor.withOpacity(0.2),
                                  width: 1.0,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.greyColor.withOpacity(0.2),
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 34.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 30.0,
                                height: 30.0,
                                child: Checkbox(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  value: this._checkBox,
                                  activeColor: Colors.grey[300],
                                  checkColor: AppColors.primaryColor,
                                  fillColor: MaterialStateProperty.resolveWith(
                                      (states) => Colors.grey[300]),
                                  onChanged: (value) {
                                    setState(() {
                                      if (_checkBox == true) {
                                        this._checkBox = false;
                                      } else {
                                        this._checkBox = true;
                                      }
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 13.w,
                              ),
                              RichText(
                                textWidthBasis: TextWidthBasis.parent,
                                overflow: TextOverflow.clip,
                                maxLines: 2,
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                    text: "I accept all the ",
                                    style: SET_FONT_STYLE(12.sp,
                                        FontWeight.w500, AppColors.blackColor),
                                    children: [
                                      TextSpan(
                                          text: "Terms & Conditions",
                                          style: GoogleFonts.inter(
                                              color: AppColors.primaryColor,
                                              fontSize: 12.sp,
                                              decoration:
                                                  TextDecoration.underline,
                                              fontWeight: FontWeight.w500),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () async {
                                              // EasyLoading.showInfo("Coming Soon");

                                              if (await canLaunch(
                                                  "https://almondvirtex.s3.ap-south-1.amazonaws.com/loyalty_app/1654584510709.pdf")) {
                                                await launch(
                                                    "https://almondvirtex.s3.ap-south-1.amazonaws.com/loyalty_app/1654584510709.pdf");
                                              } else {
                                                throw 'Could not launch t&c';
                                              }
                                              //   Navigator.push(
                                              //       context,
                                              //       MaterialPageRoute(
                                              //           builder: (context) =>
                                              //               TermsAndCondition()));

                                              print("terms tapped");
                                            }),
                                    ]),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          //button send otp
                          CustomButton(
                              onTap: () {
                                FocusManager.instance.primaryFocus?.unfocus();

                                this.loginUser(numberController.text);
                              },
                              text: "Send OTP"),
                          SizedBox(
                            height: 16.h,
                          ),
                          Text(
                            "Or",
                            style: SET_FONT_STYLE(
                                14.sp, FontWeight.w400, AppColors.blackColor),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Container(
                              height: 54.h,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color:
                                        AppColors.blackColor.withOpacity(0.4),
                                  ),
                                  borderRadius: BorderRadius.circular(6.r)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/whatapp.png",
                                    width: 28.w,
                                    height: 28.h,
                                  ),
                                  SizedBox(
                                    width: 16.w,
                                  ),
                                  Text(
                                    "WhatsApp",
                                    style: SET_FONT_STYLE(
                                        18.sp, FontWeight.w500, Colors.black),
                                  )
                                ],
                              )),
                          SizedBox(
                            height: 16.h,
                          ),
                          Text(
                            "Or",
                            style: SET_FONT_STYLE(
                                14.sp, FontWeight.w400, AppColors.blackColor),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          InkWell(
                            onTap: () {
                              FocusManager.instance.primaryFocus?.unfocus();

                              checkMissedCall(numberController.text);
                            },
                            child: Container(
                                height: 54.h,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color:
                                          AppColors.blackColor.withOpacity(0.4),
                                    ),
                                    borderRadius: BorderRadius.circular(6.r)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Give a Missed Call",
                                      style: SET_FONT_STYLE(
                                          18.sp, FontWeight.w500, Colors.black),
                                    )
                                  ],
                                )),
                          ),

                          // CustomButton(
                          //     onTap: () {
                          //       FocusManager.instance.primaryFocus?.unfocus();

                          //       checkMissedCall(numberController.text);
                          //     },
                          //     text: "Give a Missed Call"),
                          SizedBox(
                            height: 38.h,
                          ),
                          SupportWidget(),
                          SizedBox(
                            height: 50.h,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  // sendEmail() async {
  //   String email = Uri.encodeComponent("rewardssupport@almond.solutions");
  //   String subject = Uri.encodeComponent("");
  //   String body = Uri.encodeComponent("");
  //   print(subject); //output: Hello%20Flutter
  //   Uri mail = Uri.parse("mailto:$email?subject=$subject&body=$body");
  //   if (await launchUrl(mail)) {
  //     //email app opened
  //   } else {
  //     showSnackbar("Unable to open email", false, context);
  //     //email app is not opened
  //   }
  // }

  void loginUser(String mobileNumber) {
    final mobileValidation = isValidPhoneNumber(mobileNumber);
    if (mobileNumber == "") {
      showSnackbar("Please enter mobile number", false, context);
    } else if (mobileNumber.length < 10) {
      showSnackbar("Mobile number must have 10 digits", false, context);
    } else if (mobileValidation == false) {
      showSnackbar("Invalid mobile number", false, context);
    } else if (_checkBox == false) {
      showSnackbar("Please accept Terms & Conditions", false, context);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OTPScreen(
            mobile: mobileNumber.toString(),
          ),
        ),
      );
      // LoginModel data;
      // LoginServices().loginUser(mobileNumber).then((value) async {
      //   if (value.success == true) {
      //     showSnakeBar(value.message ?? "", context, true);
      //
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => OTPScreen(
      //           mobile: mobileNumber.toString(),
      //         ),
      //       ),
      //     );
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

  void checkMissedCall(String mobileNumber) {
    final mobileValidation = isValidPhoneNumber(mobileNumber);
    if (mobileNumber == "") {
      showSnackbar("Please enter mobile number", false, context);
    } else if (mobileNumber.length < 10) {
      showSnackbar("Mobile number must have 10 digits", false, context);
    } else if (mobileValidation == false) {
      showSnackbar("Invalid mobile number", false, context);
    } else if (_checkBox == false) {
      showSnackbar("Please accept Terms & Conditions", false, context);
    } else {
      _showAlertWithSingleAction(context, "", true);
    }
  }

  // void loginWithMissedCall(String mobileNumber) {
  //   VerifyOtpModel data;
  //   LOGIN_WEB_SERVICE
  //       .verifyMissedCall(mobileNumber, context)
  //       .then((value) async {
  //     if (value.status == true) {
  //       data = value.data as VerifyOtpModel;
  //       log.info(data.accessToken);
  //       saveLoginData(data);
  //       context.vxNav.clearAndPush(Uri.parse(MyRoutes.homeRoute));
  //       // setCurrentRoute(MyRoutes.homeRoute);

  //       // Navigator.pushAndRemoveUntil(
  //       //     context,
  //       //     MaterialPageRoute(builder: (context) => Home()),
  //       //         (route) => false);
  //     } else {
  //       showSnackbar(value.error!, false, context);
  //     }
  //   });
  // }

  Future<void> _showAlertWithSingleAction(
      BuildContext contextRoot, String alertMessage, bool isMissedCall) async {
    Widget doneButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        fixedSize: Size(220.w, 50.h),
        primary: AppColors.primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(49)),
        ),
      ),
      child: Text(isMissedCall ? "SUBMIT" : 'DONE',
          style: SET_FONT_STYLE(16.sp, FontWeight.w700, AppColors.whiteColor)),
      onPressed: () {
        Navigator.pop(context);
        // loginWithMissedCallNew(webMobileNumber);
      },
    );

    return showDialog(
        context: contextRoot,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState2) {
              return AlertDialog(
                backgroundColor: AppColors.whiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(33),
                ),
                elevation: 100.0,
                title: isMissedCall
                    ? Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Icon(
                          Icons.call,
                          size: 40.sp,
                        ))
                    : Image.asset("assets/images/logo.png",
                        height: 60, fit: BoxFit.contain),
                actions: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10, left: 10, right: 10),
                        child: doneButton,
                      ),
                    ],
                  ),
                ],
                content: isMissedCall
                    ? Padding(
                        padding:
                            EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: "Dial ",
                              style: SET_FONT_STYLE(
                                  20, FontWeight.w400, AppColors.blackColor),
                              children: [
                                TextSpan(
                                    text: "9873278288",
                                    style: SET_FONT_STYLE(22, FontWeight.w700,
                                        AppColors.primaryColor),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {}),
                                TextSpan(
                                    text:
                                        " number after that\nclick on submit button.",
                                    style: SET_FONT_STYLE(20, FontWeight.w400,
                                        AppColors.blackColor),
                                    recognizer: TapGestureRecognizer())
                              ]),
                        ),
                      )
                    : Text(alertMessage,
                        textAlign: TextAlign.center,
                        style: SET_FONT_STYLE(
                            18, FontWeight.w400, AppColors.blackColor)),
              );
            },
          );
        });
  }
}
