// import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:demo_video/utility/app_colors.dart';

import '../utility/constant.dart';

class InputTextField extends StatefulWidget {
  InputTextField({
    Key? key,
    required this.screenWidth,
    required this.imagePath,
    required this.placeholderText,
    required this.onChange,
    required this.isSecureText,
    required this.maxLength,
    required this.inputFormatter,
    required this.initialValue,
  }) : super(key: key);

  final double screenWidth;
  final String imagePath;
  final String placeholderText;
  final Function(String) onChange;
  final bool isSecureText;
  final int maxLength;
  final TextInputFormatter inputFormatter;
  final String initialValue;

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  FocusNode myFocus = FocusNode();

  // var txtController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // if(!myFocus.hasFocus){
    //   myFocus.requestFocus();
    // }
  }

  //
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    // if(!myFocus.hasFocus){
    //   myFocus.requestFocus();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!myFocus.hasFocus) {
          myFocus.requestFocus();
        }
      },
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: new BorderRadius.all(Radius.circular(6.r))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: (widget.screenWidth * 0.7) - 40,
              child: TextFormField(
                  cursorColor: AppColors.blackColor,
                  // controller:  txtController,
                  // initialValue: widget.initialValue,
                  focusNode: myFocus,
                  // // autofocus: !isMobile(context) && widget.placeholderText == "Mobile Number" ? true : false,
                  // style: SET_FONT_STYLE(18, FontWeight.normal, BLACK_COLOR_HCCB),
                  // obscureText: widget.isSecureText,
                  // autofocus: true,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(this.widget.maxLength),
                    FilteringTextInputFormatter.digitsOnly
                    // widget.inputFormatter,
                  ],
                  decoration: InputDecoration(
                    isDense: true,
                    filled: true,

                    hoverColor: Colors.transparent,
                    fillColor: Colors.grey[300],
                    hintText: widget.placeholderText,
                    hintStyle: SET_FONT_STYLE(
                        14, FontWeight.normal, Color(0XFFADADAD)),
                    // hintStyle: GoogleFonts.inter(
                    //     color: Color(0XFFADADAD),
                    //     fontFamily: FONT_FAMILY,
                    //     fontSize: 14,
                    //     fontWeight: FontWeight.w400),
                    contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  onChanged: (String str) {
                    widget.onChange(str);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
