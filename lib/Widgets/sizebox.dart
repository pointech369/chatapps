import 'package:flutter/material.dart';

class CustomSizeBox extends StatelessWidget {
  final double width;

  CustomSizeBox({required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: width,
    );
  }
}


class TextSizeBox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15,
    );
  }
}