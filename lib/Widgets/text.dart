import 'package:flutter/material.dart';
import '../Constant/colors.dart';

class CustomHeading extends StatelessWidget {
  final String text;

  CustomHeading({required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 34,
        color: headTextColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class CustomSubHeading extends StatelessWidget {
  final String text;

  CustomSubHeading({required this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 70),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: subHeadTextColor,
        ),
      ),
    );
  }
}

class TextFieldText extends StatelessWidget {
  final String text;

  TextFieldText({required this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 80),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class FormTitleText extends StatelessWidget {
  final String text;

  FormTitleText({required this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 80),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 18, color: nextbuttonColor, fontWeight: FontWeight.w900),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;

  CustomText({required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 14,
          color: Color.fromRGBO(0, 0, 0, 0.5),
          fontWeight: FontWeight.w400),
    );
  }
}

class PreviewText extends StatelessWidget {
  final String nametext;
  final String maintext;

  PreviewText({required this.nametext, required this.maintext});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: RichText(
            text: TextSpan(children: [
          TextSpan(
            text: nametext,
            style: TextStyle(color: Colors.black, fontSize: 15.0),
          ),
          WidgetSpan(
            child: SizedBox(width: 10), // Add a SizedBox between the text spans
          ),
          TextSpan(
            text: maintext,
            style: TextStyle(
              color: nextbuttonColor,
              fontSize: 16.0,
              fontWeight: FontWeight.w800,
            ),
          )
        ])));
  }
}
