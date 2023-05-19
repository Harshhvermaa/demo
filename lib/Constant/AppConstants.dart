import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';




class AppConstants{

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

}