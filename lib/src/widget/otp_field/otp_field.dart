import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_component/src/constants/color_constants.dart';
import 'package:flutter_component/src/widget/otp_field/style.dart';

import 'otp_field_style.dart';

class OTPTextField extends StatefulWidget {
  /// Number of the OTP Fields
  final int length;

  /// Total Width of the OTP Text Field
  final double width;

  /// Width of the single OTP Field
  final double fieldWidth;

  /// margin around the text fields
  final EdgeInsetsGeometry margin;

  /// Manage the type of keyboard that shows up
  final TextInputType keyboardType;

  /// The style to use for the text being edited.
  final TextStyle style;

  /// The style to use for the text being edited.
  final double outlineBorderRadius;

  /// Text Field Alignment
  /// default: MainAxisAlignment.spaceBetween [MainAxisAlignment]
  final MainAxisAlignment textFieldAlignment;

  /// Obscure Text if data is sensitive
  final bool obscureText;

  /// Text Field Style
  final OtpFieldStyle? otpFieldStyle;

  /// Text Field Style for field shape.
  /// default FieldStyle.underline [FieldStyle]
  final FieldStyle fieldStyle;

  /// Callback function, called when a change is detected to the pin.
  final ValueChanged<String>? onChanged;

  /// Callback function, called when pin is completed.
  final ValueChanged<String>? onCompleted;

  final double borderWidth;

  String pinData;

  OTPTextField(
      {Key? key,
      this.length = 4,
      this.width = 10,
      this.fieldWidth = 30,
      this.margin = const EdgeInsets.symmetric(horizontal: 3),
      this.otpFieldStyle,
      this.keyboardType = TextInputType.number,
      this.style = const TextStyle(),
      this.outlineBorderRadius = 10,
      this.textFieldAlignment = MainAxisAlignment.spaceBetween,
      this.obscureText = false,
      this.fieldStyle = FieldStyle.underline,
      this.onChanged,
      this.pinData = '',
      this.borderWidth = 1,
      this.onCompleted})
      : assert(length > 1);

  @override
  _OTPTextFieldState createState() => _OTPTextFieldState();
}

class _OTPTextFieldState extends State<OTPTextField> {
  OtpFieldStyle? _otpFieldStyle;
  late List<FocusNode?> _focusNodes;
  late List<TextEditingController?> _textControllers;

  List<Widget>? _textFields;
  List<String>? _pin;

  @override
  void initState() {
    if (widget.otpFieldStyle == null) {
      _otpFieldStyle = OtpFieldStyle();
    } else {
      _otpFieldStyle = widget.otpFieldStyle;
    }

    super.initState();

    _focusNodes = List<FocusNode?>.filled(widget.length, null, growable: false);
    _textControllers = List<TextEditingController?>.filled(widget.length, null,
        growable: false);

    _pin = List.generate(widget.length, (int i) {
      return '';
    });
    _textFields = List.generate(widget.length, (int i) {
      return buildTextField(context, i);
    });
  }

  @override
  void dispose() {
    _textControllers
        .forEach((TextEditingController? controller) => controller!.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.pinData.isNotEmpty) {
      _pin!.clear();
      List<String> pin = widget.pinData.split('');
      _pin!.addAll(pin);
      for (var i = 0; i < _textFields!.length; i++) {
        _textControllers[i]!.text = _pin![i];
      }
      widget.pinData = '';
    }

    return Row(
      mainAxisAlignment: widget.textFieldAlignment,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: _textFields!,
    );
  }

  /// This function Build and returns individual TextField item.
  ///
  /// * Requires a build context
  /// * Requires Int position of the field
  Widget buildTextField(BuildContext context, int i) {
    if (_focusNodes[i] == null) _focusNodes[i] = new FocusNode();

    if (_textControllers[i] == null)
      _textControllers[i] = new TextEditingController();

    return Row(
      children: [
        Container(
          width: widget.fieldWidth,
          margin: widget.margin,
          child: RawKeyboardListener(
            focusNode: FocusNode(),
            onKey: (event) {
              if (_textControllers[i]!.text.isEmpty &&
                  event.data.logicalKey == LogicalKeyboardKey.backspace) {
                if (i == 0) return;
                _focusNodes[i]!.unfocus();
                _focusNodes[i - 1]!.requestFocus();
              }
            },
            child: Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Color(ColorConstants.whiteLiteColor),
                borderRadius: BorderRadius.all(
                    Radius.circular(widget.outlineBorderRadius)),
                border: Border.all(
                    color: widget.otpFieldStyle!.borderColor,
                    width: widget.borderWidth),
              ),
              child: TextField(
                controller: _textControllers[i],
                keyboardType: widget.keyboardType,
                textAlign: TextAlign.center,
                style: widget.style,
                focusNode: _focusNodes[i],
                obscureText: widget.obscureText,
                maxLength: 1,
                decoration: const InputDecoration(
                    counterText: "",
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none),
                onChanged: (String str) {
                  if (str.length > 1) {
                    _handlePaste(str);
                    return;
                  }

                  // Check if the current value at this position is empty
                  // If it is move focus to previous text field.
                  if (str.isEmpty) {
                    if (i == 0) return;
                    _focusNodes[i]!.unfocus();
                    _focusNodes[i - 1]!.requestFocus();
                  }

                  // Update the current pin
                  setState(() {
                    _pin![i] = str;
                  });

                  // Remove focus
                  if (str.isNotEmpty) _focusNodes[i]!.unfocus();
                  // Set focus to the next field if available
                  if (i + 1 != widget.length && str.isNotEmpty)
                    FocusScope.of(context).requestFocus(_focusNodes[i + 1]);

                  String currentPin = _getCurrentPin();

                  // if there are no null values that means otp is completed
                  // Call the `onCompleted` callback function provided
                  if (!_pin!.contains(null) &&
                      !_pin!.contains('') &&
                      currentPin.length == widget.length) {
                    widget.onCompleted!(currentPin);
                  }

                  // Call the `onChanged` callback function
                  widget.onChanged!(currentPin);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  String _getCurrentPin() {
    String currentPin = "";
    _pin!.forEach((String value) {
      currentPin += value;
    });
    return currentPin;
  }

  void _handlePaste(String str) {
    if (str.length > widget.length) {
      str = str.substring(0, widget.length);
    }

    for (int i = 0; i < str.length; i++) {
      String digit = str.substring(i, i + 1);
      _textControllers[i]!.text = digit;
      _pin![i] = digit;
    }

    FocusScope.of(context).requestFocus(_focusNodes[widget.length - 1]);

    String currentPin = _getCurrentPin();

    // if there are no null values that means otp is completed
    // Call the `onCompleted` callback function provided
    if (!_pin!.contains(null) &&
        !_pin!.contains('') &&
        currentPin.length == widget.length) {
      widget.onCompleted!(currentPin);
    }

    // Call the `onChanged` callback function
    widget.onChanged!(currentPin);
  }
}
