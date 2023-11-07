import 'package:chatapp/Constant/colors.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.text,
    this.press,
  }) : super(key: key);
  final String? text;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press as void Function()?,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              primaryColor,
              buttonColor,
              buttonColor,
              buttonColor,
            ],
          ),
        ),
        child: Center(
          child: Text(
            text!,
            style: TextStyle(
              fontSize: (20),
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        // ),
      ),
    );
  }
}
