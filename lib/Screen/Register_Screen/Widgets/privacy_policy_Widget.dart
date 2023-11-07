import 'package:flutter/material.dart';

class PrivacyPolicyWidget extends StatelessWidget {
  const PrivacyPolicyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: true,
          onChanged: (newValue) {
            print("object");
          },
        ),

        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'I agree to  ',
                style: TextStyle(color: Colors.black, fontSize: 12.0),
              ),
              TextSpan(
                text: 'Privacy Policy ',
                style: TextStyle(
                    color: Color.fromRGBO(76, 110, 212, 1), fontSize: 12.0),
              ),
              TextSpan(
                text: "&",
                style: TextStyle(color: Colors.black, fontSize: 12.0),
              ),
              TextSpan(
                text: ' Terms and Conditions:',
                style: TextStyle(
                    color: Color.fromRGBO(76, 110, 212, 1), fontSize: 12.0),
              ),
            ],
          ),
        ),
        // CustomText(text: 'I agree Epass Privacy Policy & Terms and Conditions',),
      ],
    );
  }
}
