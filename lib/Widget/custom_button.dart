import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:demo_video/utility/app_colors.dart';

import '../utility/constant.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  final void Function()? onTap;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: gradiantBlue,
            )),
        child: Text(
          text!,
          style: SET_FONT_STYLE(18.sp, FontWeight.w500, AppColors.whiteColor),
        ),
      ),
    );
  }
}
