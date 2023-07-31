import 'package:flutter/material.dart';
import 'package:flutter_component/flutter_component.dart';

class KButtonLoading extends StatelessWidget {
  final Function onPressed;
  final String text;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;
  final bool isLoading;
  final Color loadingColor;

  const KButtonLoading({
    Key? key,
    required this.onPressed,
    required this.text,
    this.buttonStyle,
    this.textStyle,
    this.isLoading = false,
    this.loadingColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed.call();
      },
      style: buttonStyle ?? KButtonStyle.buttonStyle(),
      child: !isLoading
          ? KText(
              text: text,
              textStyle: textStyle ??
                  KTextStyles.textStyle(
                      fontSize: 12.0, fontColor: Colors.white),
            )
          : SizedBox(
              height: 16,
              width: 16,
              child: CircularProgressIndicator(
                color: loadingColor,
                strokeWidth: 2,
              ),
            ),
    );
  }
}
