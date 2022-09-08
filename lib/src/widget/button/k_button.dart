import 'package:flutter/material.dart';
import 'package:flutter_component/flutter_component.dart';
import 'package:flutter_component/src/widget/button/k_button_style.dart';

class KButton extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final Function onPressed;
  final Color? buttonColor;
  final ButtonStyle? buttonStyle;

  const KButton({Key? key,
    required this.text,
    required this.onPressed,
    this.buttonColor,
    this.buttonStyle,
    this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed.call();
      },
      style: buttonStyle ?? KButtonStyle.buttonStyle(),
      child: KText(
        text: text,
        textStyle: textStyle ?? KTextStyles.textStyle(
          fontSize: 12.0,
          fontColor: Colors.white.value
        ),
      ),
    );
  }
}
