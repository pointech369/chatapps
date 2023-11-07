import 'dart:io';

import 'package:chatapp/Constant/colors.dart';
import 'package:chatapp/Screen/Search_Screen/Screen/search_Screen.dart';
import 'package:chatapp/Screen/Search_Screen/body.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/Constant/colors.dart';

import '../Constant/image.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
// class MyAppBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  MyAppBar({required this.scaffoldKey});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white, size: 30),
      elevation: 2,
      title: Text("ChatApp",
          style: TextStyle(
            color: Colors.white,
          )),
      // Text("Logo",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 27,color: kprimaryColor),),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
            },
            icon: Icon(Icons.search))
        // child: ,
      ],
      backgroundColor: primaryColor,
    );
  }
}
