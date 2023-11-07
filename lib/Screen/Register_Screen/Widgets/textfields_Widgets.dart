import 'package:chatapp/Components/sharedPreferences.dart';
import 'package:chatapp/Screen/Home_Screen/body.dart';
import 'package:chatapp/Screen/Register_Screen/Widgets/privacy_policy_Widget.dart';
import 'package:chatapp/Widgets/error.dart';
import 'package:chatapp/Widgets/sizebox.dart';
import 'package:chatapp/Widgets/text.dart';
import 'package:chatapp/Widgets/textfield.dart';
import 'package:flutter/material.dart';

import '../../../Service/auth.dart';
import '../../../Widgets/button.dart';

class TextfieldWidget extends StatefulWidget {
  @override
  State<TextfieldWidget> createState() => _TextfieldWidgetState();
}

class _TextfieldWidgetState extends State<TextfieldWidget> {
  final _formKey = GlobalKey<FormState>();

  final fullName = TextEditingController(text: "kripas");

  final email = TextEditingController(text: "kripask50@gmail.com");

  final password = TextEditingController(text: "Flutter1234");
  AuthService authService = AuthService();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor))
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextSizeBox(),
                TextFieldText(
                  text: 'Full Name',
                ),
                TextFormField(
                    controller: fullName,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Type of Full Name";
                      }
                      return null;
                    },
                    decoration: customDecoration(
                      "Full Name",
                      "",
                    )),
                TextSizeBox(),
                TextFieldText(
                  text: 'E-mail',
                ),
                TextFormField(
                    controller: email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Email";
                      }
                      return null;
                    },
                    decoration: customDecoration(
                      "Please Enter Email",
                      "",
                    )),
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
                TextFieldText(
                  text: 'Confirm Password',
                ),
                TextFormField(
                    controller: password,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Confirm Password";
                      }
                      return null;
                    },
                    decoration: customDecoration(
                      "********",
                      "",
                    )),
                TextSizeBox(),
                PrivacyPolicyWidget(),
                DefaultButton(
                  press: () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        _isLoading = true;
                      });
                      await authService
                          .registerUserWithEmailandPassword(
                              fullName.text, email.text, password.text)
                          .then((value) async {
                        if (value == true) {
                          await SharedDataFunctions.saveUserLoggedInStatus(
                              true);
                          await SharedDataFunctions.saveUserEmailSF(email.text);
                          await SharedDataFunctions.saveUserNameSF(
                              fullName.text);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                          );
                        } else {
                          showSnackbar(context, Colors.red, value);
                          setState(() {
                            _isLoading = false;
                          });
                        }
                      });
                    }
                  },
                  text: "PROCEED",
                ),
              ],
            ),
    );
  }

  register() async {}
}
