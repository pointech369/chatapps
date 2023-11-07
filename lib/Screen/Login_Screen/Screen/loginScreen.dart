import 'package:chatapp/Constant/image.dart';
import 'package:chatapp/Screen/Login_Screen/Widgets/textfield.dart';
import 'package:chatapp/Screen/Register_Screen/body.dart';
import 'package:chatapp/Service/auth.dart';
import 'package:chatapp/Widgets/sizebox.dart';
import 'package:chatapp/Widgets/text.dart';
import 'package:flutter/material.dart';

import '../../../Constant/colors.dart';
import '../../../routes.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _showVisitorWidget = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeading(text: 'LOGIN'),
        CustomSubHeading(
            text:
                'Please enter your registered mobile number and password to login.'),

        ///TEXTFIELD WIDGET START

        TextSizeBox(),
        LoginTextfield(),
        TextSizeBox(),
        InkWell(
          onTap: () {
            AuthService().loginwithgoogle(context);
            //  SiginService().signInWithGoogle();
          },
          child: Card(
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Image.asset(
                  "assets/images/googlelogo.png",
                  height: 30,
                ),
              ),
            ),
          ),
        ),

        ///TEXTFIELD WIDGET END
        InkWell(
            onTap: () {
              // Navigator.pushNamed(context, (Routes.forgotpsw));
            },
            child: Center(
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
                // return print("object");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
              child: Text(
                "Register Now",
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            )
          ],
        ),
        TextSizeBox(),
        TextSizeBox(),
      ],
    );
  }
}
