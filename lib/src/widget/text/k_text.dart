import 'package:flutter/material.dart';
import 'package:flutter_component/flutter_component.dart';
import 'package:flutter_component/src/constants/string_constants.dart';

class KText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final TextDecoration? textDecoration;
  final int? fontColor;
  final TextOverflow? textOverflow;

  const KText(
      {Key? key,
      required this.text,
      this.fontSize,
      this.fontFamily,
      this.fontWeight,
      this.textDecoration,
      this.fontColor,
      this.letterSpacing,
      this.textOverflow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow ?? TextOverflow.clip,
      style: Styles.textStyle(
          fontSize: fontSize ?? 12.0,
          fontFamily: fontFamily ?? Constants.inter,
          fontWeight: fontWeight ?? FontWeight.normal,
          decoration: textDecoration ?? TextDecoration.none,
          letterSpacing: letterSpacing ?? 0.1,
          fontColor: fontColor ?? Colors.black.value),
    );
  }
}
