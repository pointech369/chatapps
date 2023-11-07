import 'package:chatapp/Screen/Home_Screen/Screen/homePage.dart';
import 'package:chatapp/Screen/Welcome_Screen/Screen/welcomeScreen.dart';
import 'package:chatapp/Service/database_Service.dart';
import 'package:chatapp/Widgets/error.dart';
import 'package:chatapp/Widgets/text.dart';
import 'package:chatapp/Widgets/textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Components/sharedPreferences.dart';
import '../../../Service/auth.dart';
import '../../../Widgets/button.dart';
import '../../../Widgets/sizebox.dart';
import '../../Home_Screen/body.dart';

class LoginTextfield extends StatefulWidget {
  @override
  State<LoginTextfield> createState() => _LoginTextfieldState();
}

class _LoginTextfieldState extends State<LoginTextfield> {
  final _formKey = GlobalKey<FormState>();

  //
  final email = TextEditingController();

  final password = TextEditingController();

  bool _isLoading = false;

  AuthService authService = AuthService();

  // final mobilenumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextSizeBox(),
                TextFieldText(
                  text: 'Username (Mobile Number)',
                ),
                TextFormField(
                    controller: email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Mobile Number";
                      }
                      return null;
                    },
                    decoration: customPrefixDecoration(
                        "Please enter mobile number",
                        "",
                        Icon(Icons.phone_android_rounded))),
                TextSizeBox(),
                TextFieldText(
                  text: 'Password',
                ),
                TextFormField(
                    controller: password,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Password";
                      }
                      return null;
                    },
                    decoration: customDecoration(
                      "********",
                      "",
                    )),
                TextSizeBox(),
                DefaultButton(
                    text: "LOGIN",
                    press: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _isLoading = true;
                        });
                        await authService
                            .loginWithUserNameandPassword(
                                email.text, password.text)
                            .then((value) async {
                          if (value == true) {
                            QuerySnapshot snapshot = await DatabaseService(
                                    uid: FirebaseAuth.instance.currentUser!.uid)
                                .gettingUserData(email.text);
                            await SharedDataFunctions.saveUserLoggedInStatus(
                                true);
                            await SharedDataFunctions.saveUserEmailSF(
                                email.text);
                            await SharedDataFunctions.saveUserNameSF(
                                snapshot.docs[0]['fullName']);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WelcomeScreen()),
                            );
                          } else {
                            showSnackbar(context, Colors.red, value);
                            setState(() {
                              _isLoading = false;
                            });
                          }
                        });
                      }
                    }),
                TextSizeBox(),
              ],
            ),
    );
  }
}
