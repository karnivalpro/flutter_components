
import 'package:flutter/material.dart';
import 'package:flutter_component/flutter_component.dart';
import 'package:flutter_component/src/constants/string_constants.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class KText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final bool isSelectionEnable;
  final TextOverflow? textOverflow;

  const KText(
      {Key? key,
      required this.text, this.textStyle,
        this.textAlign,
        this.isSelectionEnable = false,
      this.textOverflow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return kIsWeb && isSelectionEnable ? SelectableText(text,
      textAlign: textAlign ?? TextAlign.start,
      // overflow: textOverflow ?? TextOverflow.clip,
      style: textStyle ?? KTextStyles.textStyle(
          fontSize: 12.0,
          fontFamily: Constants.inter,
          fontWeight: FontWeight.normal,
          decoration: TextDecoration.none,
          letterSpacing: 0.1,
          fontColor: Colors.black),) : Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      overflow: textOverflow ?? TextOverflow.clip,
      style: textStyle ?? KTextStyles.textStyle(
          fontSize: 12.0,
          fontFamily: Constants.inter,
          fontWeight: FontWeight.normal,
          decoration: TextDecoration.none,
          letterSpacing: 0.1,
          fontColor: Colors.black),
    );
  }
}
