import 'package:chatapp/Screen/Login_Screen/Screen/loginScreen.dart';
import 'package:flutter/material.dart';

import '../../Widgets/appbar.dart';

class loginScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // key: _scaffoldKey,
        // appBar: MyAppBar(
        //   scaffoldKey: _scaffoldKey,
        // ),
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 40),
        child: Body(),
      ),
    ));
  }
}
