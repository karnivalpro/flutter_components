import 'package:flutter/material.dart';
import 'package:flutter_component/flutter_component.dart';
import 'package:flutter_component/src/constants/color_constants.dart';

class KPasswordField extends StatefulWidget {
  final String text;
  final TextEditingController? controller;

  const KPasswordField({Key? key, required this.text, this.controller})
      : super(key: key);

  @override
  State<KPasswordField> createState() => _KPasswordFieldState();
}

class _KPasswordFieldState extends State<KPasswordField> {
  bool obscureText = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: obscureText,
      validator: (v){
        if(v == null){
          return "Please enter password";
        }
        return null;
      },
      decoration: InputDecoration(
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(ColorConstants.greyColorC6),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(ColorConstants.greyColorC6),
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(ColorConstants.greyColorC6),
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(ColorConstants.greyColorC6),
            width: 1,
          ),
        ),
        label: KText(
          text: widget.text,
          textStyle: KTextStyles.textStyle(
              fontSize: 12, fontColor: ColorConstants.greyColorC6),
        ),
      ),
    );
  }
}
