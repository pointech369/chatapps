import 'package:chatapp/Screen/Login_Screen/Body.dart';
import 'package:chatapp/Widgets/text.dart';
import 'package:flutter/material.dart';

import '../../../Constant/colors.dart';
import '../../../Widgets/sizebox.dart';
import '../../../routes.dart';
import '../Widgets/textfields_Widgets.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _showVisitorWidget = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSizeBox(
            width: 0,
          ),
          CustomHeading(text: 'REGISTER'),
          CustomSubHeading(
              text:
                  'Please fill all the information below to register on ChatApp.'),

          TextSizeBox(),
          TextfieldWidget(),
          TextSizeBox(),

          ///TEXTFIELD WIDGET END
          Center(
              child: InkWell(
                  child: CustomText(
            text: "Forgot Password ?",
          ))),
          TextSizeBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: "Already have an account?",
              ),
              SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => loginScreen()),
                  );
                },
                child: Text(
                  "Login Now",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          TextSizeBox(),
          TextSizeBox(),
        ],
      ),
    );
  }
}
