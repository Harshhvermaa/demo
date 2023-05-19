import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:demo_video/utility/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utility/constant.dart';

class SupportWidget extends StatelessWidget {
  const SupportWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("For Support",
                style: SET_FONT_STYLE(
                    14.sp, FontWeight.bold, AppColors.blackColor)),
            SizedBox(
              width: 6.w,
            ),
            RichText(
              textWidthBasis: TextWidthBasis.parent,
              overflow: TextOverflow.clip,
              maxLines: 2,
              textAlign: TextAlign.start,
              text: TextSpan(
                  text: "Call us on",
                  style: SET_FONT_STYLE(
                      14.sp, FontWeight.w600, AppColors.blackColor),
                  children: [
                    TextSpan(
                        text: " 1800 572 9855",
                        style: GoogleFonts.inter(
                            color: AppColors.primaryColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            _makePhoneCall("18005729855");
                          }),
                  ]),
            ),
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Made with ",
                style: SET_FONT_STYLE(
                    14.sp, FontWeight.w500, AppColors.blackColor)),
            SizedBox(
              width: 5.w,
            ),
            Image.asset(
              "assets/images/heart.png",
              width: 21.w,
              height: 21.h,
            ),
            SizedBox(
              width: 6.w,
            ),
            Image.asset(
              "assets/images/almond.png",
              width: 66.w,
              height: 20.h,
            ),
          ],
        ),
      ],
    );
  }

  //make call
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}
