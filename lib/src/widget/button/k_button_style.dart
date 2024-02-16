import 'package:flutter/material.dart';

class KButtonStyle {
  static ButtonStyle buttonStyle(
      {Color? buttonBgColor,
      Size? minimumSize,
      Size? maximumSize,
      Size? fixedSize,
      OutlinedBorder? border}) {
    return ElevatedButton.styleFrom(
        backgroundColor: buttonBgColor ?? Colors.blue,
        elevation: 12,
        padding: const EdgeInsets.all(16),
        fixedSize: fixedSize,
        maximumSize: maximumSize,
        minimumSize: minimumSize,
        shape: border ??
            const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6))));
  }

  static ButtonStyle buttonStyleBorder(
      {Color? buttonBgColor,
      Size? minimumSize,
      Size? maximumSize,
      Size? fixedSize,
      OutlinedBorder? border}) {
    return ElevatedButton.styleFrom(
        backgroundColor: buttonBgColor ?? Colors.blue,
        // button Background color
        elevation: 12,
        padding: const EdgeInsets.all(16),
        fixedSize: fixedSize,
        maximumSize: maximumSize,
        minimumSize: minimumSize,
        shape: border ??
            const RoundedRectangleBorder(
                side: BorderSide(
                    style: BorderStyle.solid, color: Colors.red, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(6))));
  }
}
