import 'package:flutter/material.dart';
import 'package:flutter_component/src/constants/color_constants.dart';
import 'package:flutter_component/src/constants/string_constants.dart';

class KTextStyles {
  static TextStyle textStyle(
      {double fontSize = 12,
      int? fontColor,
      FontWeight fontWeight = FontWeight.normal,
      String fontFamily = Constants.inter,
      double letterSpacing = 0.1,
      TextDecoration decoration = TextDecoration.none}) {
    return TextStyle(
        fontSize: fontSize,
        color: Color(fontColor ?? ColorConstants.blackColor),
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        letterSpacing: letterSpacing,
        decoration: decoration);
  }
}
