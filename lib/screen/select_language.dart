import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:demo_video/screen/login_screen.dart';

import '../utility/constant.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({Key? key}) : super(key: key);

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  bool lang1 = false;
  bool lang2 = false;
  bool lang3 = false;
  bool lang4 = false;
  List language=[];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // width: double.infinity,
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
                  Container(

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 19.w),
                          child: Image.asset(
                            "assets/images/KotakLogo.png",
                            width: 150.w,
                            height: 100.h,

                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 19.w),
                    child: Text(
                      "Choose Your Language",
                      style:
                      SET_FONT_STYLE(20.sp, FontWeight.w400, Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 19.w),
                    child: Text(
                      "Language",
                      style:
                      SET_FONT_STYLE(40.sp, FontWeight.w700, Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 43.h,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      // doSomething("Attention");
                      setState(() {
                        lang1 = true;
                        lang2 = false;
                        lang3=false;
                        lang4=false;
                        // isSelected = false;
                      });


                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: lang1 == true ? Colors.green : Colors.white,
                      ),
                      width: 164.w,
                      height: 68.h,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/english.png",
                              width: 42.w,
                              height: 38.h,
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8, left: 8),
                              child: Column(
                                children: [
                                  Text(
                                    "English",
                                    style: SET_FONT_STYLE(
                                        16.sp, FontWeight.w500, Colors.black),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    "अंग्रेज़ी",
                                    style: SET_FONT_STYLE(
                                        12.sp, FontWeight.w500, Colors.black),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        lang2 = true;
                        lang1=false;
                        lang3=false;
                        lang4=false;



                      });

                    },

                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color(0xffE3E3E3),
                            width: 1.0,
                            style: BorderStyle.solid
                        ),
                        borderRadius: BorderRadius.circular(6.r),
                        color:lang2 == true ? Colors.green : Colors.white,
                      ),
                      width: 164.w,
                      height: 68.h,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/hindi.png",
                              width: 42.w,
                              height: 38.h,
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8, left: 8),
                              child: Column(
                                children: [
                                  Text(
                                    "Hindi",
                                    style: SET_FONT_STYLE(
                                        16.sp, FontWeight.w500, Colors.black),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    "हिंदी",
                                    style: SET_FONT_STYLE(
                                        12.sp, FontWeight.w500, Colors.black),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w,),
              child: Row(
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {

                        lang3 = true;
                        lang1=false;
                        lang2=false;
                        lang4=false;
                      });
                    },
                    child:  Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color(0xffE3E3E3),
                            width: 1.0,
                            style: BorderStyle.solid
                        ),
                        borderRadius: BorderRadius.circular(6.r),
                        color:  lang3 == true ? Colors.green : Colors.white,
                      ),
                      width: 164.w,
                      height: 68.h,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/Marathi.png",
                              width: 42.w,
                              height: 38.h,
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8, left: 8),
                              child: Column(
                                children: [
                                  Text(
                                    "Marathi",
                                    style: SET_FONT_STYLE(
                                        16.sp, FontWeight.w500, Colors.black),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    "मराठी",
                                    style: SET_FONT_STYLE(
                                        12.sp, FontWeight.w500, Colors.black),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w,),
                  InkWell(
                    onTap: (){
                      setState(() {

                        lang4 = true;
                        lang1=false;
                        lang3=false;
                        lang2=false;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color(0xffE3E3E3),
                            width: 1.0,
                            style: BorderStyle.solid
                        ),
                        borderRadius: BorderRadius.circular(6.r),
                        color:  lang4 == true ? Colors.green : Colors.white,
                      ),
                      width: 164.w,
                      height: 68.h,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/tamil.png",
                              width: 42.w,
                              height: 38.h,
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8, left: 8),
                              child: Column(
                                children: [
                                  Text(
                                    "Telegu",
                                    style: SET_FONT_STYLE(
                                        16.sp, FontWeight.w500, Colors.black),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    "तेलुगु",
                                    style: SET_FONT_STYLE(
                                        12.sp, FontWeight.w500, Colors.black),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 84.h,
            ),
            InkWell(
              onTap: () {
                print(lang3);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => LoginScreen()) );
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
                        style: BorderStyle.solid
                    ),
                    borderRadius: BorderRadius.circular(6.r)
                ),
                child: Center(child: Text("Proceed", style: SET_FONT_STYLE(
                    18.sp, FontWeight.w500, Colors.white),)),
              )
            )
          ],
        ),
      ),
    );
  }
  // void doSomething(String buttonName){
  //   if(buttonName == "Attention"){
  //     if(pressAttention = false){
  //       pressAttention = true;
  //     } else {
  //       pressAttention = false;
  //     }
  //   }
  // }
}

