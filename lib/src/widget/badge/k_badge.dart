import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_component/flutter_component.dart';

class KBadge extends StatelessWidget {
  final String? value;
  final KBadgeType kBadgeType;
  final Color? bgColor;
  final TextStyle? textStyle;

  const KBadge(
      {super.key,
      this.value,
      required this.kBadgeType,
      this.bgColor,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    if (kBadgeType == KBadgeType.normal) {
      return _badgeWidget(value: value, textStyle: textStyle);
    } else if (kBadgeType == KBadgeType.primary) {
      return _badgeWidget(
          textStyle:
              textStyle ?? KTextStyles.textStyle(fontColor: Colors.white),
          value: value,
          bgColor: bgColor ?? Theme.of(context).primaryColor);
    } else if (kBadgeType == KBadgeType.primaryInverted) {
      return _badgeWidget(
          value: value,
          bgColor: Colors.white,
          textStyle: textStyle ??
              KTextStyles.textStyle(fontColor: Theme.of(context).primaryColor));
    } else if (kBadgeType == KBadgeType.imported) {
      return _badgeWidget(
          value: value,
          bgColor: bgColor ?? Colors.redAccent,
          textStyle:
              textStyle ?? KTextStyles.textStyle(fontColor: Colors.white));
    } else if (kBadgeType == KBadgeType.added) {
      return _badgeWidget(
          value: '+$value',
          bgColor: bgColor ?? Colors.green.withOpacity(0.2),
          textStyle:
              textStyle ?? KTextStyles.textStyle(fontColor: Colors.green));
    } else if (kBadgeType == KBadgeType.removed) {
      return _badgeWidget(
          value: '-$value',
          bgColor: bgColor ?? Colors.redAccent.withOpacity(0.2),
          textStyle:
              textStyle ?? KTextStyles.textStyle(fontColor: Colors.redAccent));
    }

    return Container();
  }

  Container _badgeWidget({
    EdgeInsetsGeometry? padding,
    Color? bgColor,
    String? value,
    TextStyle? textStyle,
  }) {
    return Container(
      padding: padding ??
          const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
      decoration: BoxDecoration(
          color: bgColor ?? Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(16)),
      child: KText(
        text: value ?? '',
        textStyle: textStyle,
      ),
    );
  }
}

enum KBadgeType {
  normal,
  primary,
  primaryInverted,
  imported,
  added,
  removed,
}
