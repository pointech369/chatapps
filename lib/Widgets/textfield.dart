import 'package:flutter/material.dart';

import '../Constant/colors.dart';

InputDecoration customDecoration(
  String hintText,
  String labelText,
) {
  bool _showVisitorWidget = true;
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
    fillColor: Colors.white,
    filled: true,
    hintText: hintText,
    // prefixIcon:_showVisitorWidget? icon :Text(),

    hintStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: boarderColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: boarderColor,
        width: 0.0,
      ),
      borderRadius: BorderRadius.circular(5),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: Colors.blueGrey),
    ),
    hoverColor: primaryColor,
  );
}

InputDecoration customPrefixDecoration(
    String hintText, String labelText, Icon icon) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
    fillColor: Colors.white,
    filled: true,
    hintText: hintText,
    prefixIcon: icon,
    hintStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: boarderColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: boarderColor,
        width: 0.0,
      ),
      borderRadius: BorderRadius.circular(5),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: Colors.blueGrey),
    ),
    hoverColor: primaryColor,
  );
}

Decoration customDropDownDecoration() {
  return BoxDecoration(
      color: kprimarycolor,
      borderRadius: BorderRadius.circular(7),
      border: Border.all(color: primaryColor, width: 0.4));
}
