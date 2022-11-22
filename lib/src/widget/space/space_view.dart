import 'package:flutter/material.dart';

class SpaceView extends StatelessWidget {

  final double height;
  final double width;

  const SpaceView({Key? key, this.height=12, this.width = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
