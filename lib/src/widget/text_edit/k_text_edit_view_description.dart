import 'package:flutter/material.dart';
import 'package:flutter_component/flutter_component.dart';
import 'package:flutter_component/src/constants/color_constants.dart';

class KTextEditViewDescription extends StatefulWidget {
  final String text;
  final TextEditingController? controller;
  final Function(String) onChange;
  final Function? onFinished;
  final TextInputAction? textInputAction;
  final bool isValidation;
  final String? errorMessage;
  final String? validateRegex;
  final int? maxLine;
  final int? maxLength;
  final InputDecoration? inputDecoration;

  const KTextEditViewDescription({
    Key? key,
    required this.text,
    this.controller,
    required this.onChange,
    this.onFinished,
    this.textInputAction,
    this.isValidation = false,
    this.errorMessage,
    this.validateRegex,
    this.maxLength,
    this.maxLine,
    this.inputDecoration,
  }) : super(key: key);

  @override
  State<KTextEditViewDescription> createState() =>
      _KTextEditViewDescriptionState();
}

class _KTextEditViewDescriptionState extends State<KTextEditViewDescription> {
  FocusNode focusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        widget.onFinished?.call();
        if (widget.isValidation) {
          _formKey.currentState!.validate();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextFormField(
        maxLines: widget.maxLine,
        maxLength: widget.maxLength,
        focusNode: focusNode,
        textInputAction: widget.textInputAction ?? TextInputAction.none,
        controller: widget.controller,
        validator: (value) {
          if (value != null) {
            final regex = RegExp(widget.validateRegex!);
            if (!regex.hasMatch(value)) {
              return widget.errorMessage ?? "";
            }
          }
          return null;
        },
        onChanged: (value) {
          widget.onChange.call(value);
        },
        decoration: widget.inputDecoration ?? InputDecoration(
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
              color: Color(ColorConstants.redErrorColor),
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(ColorConstants.greyColorC6),
              width: 1,
            ),
          ),
          alignLabelWithHint: true,
          label: KText(
            text: widget.text,
            textStyle: KTextStyles.textStyle(
                fontSize: 12, fontColor: Color(ColorConstants.greyColorC6)),
          ),
        ),
      ),
    );
  }
}
