import 'package:chatapp/Components/sharedPreferences.dart';
import 'package:chatapp/Screen/Home_Screen/Screen/homePage.dart';
import 'package:chatapp/Screen/Home_Screen/body.dart';
import 'package:flutter/material.dart';

import '../../../Constant/colors.dart';
import '../../../Service/auth.dart';
import '../../Login_Screen/body.dart';

class Drawers extends StatefulWidget {
  @override
  State<Drawers> createState() => _DrawersState();
}

class _DrawersState extends State<Drawers> {
  AuthService authService = AuthService();

  String name = "";

  String email = "";

  Stream? groups;

  bool _isLoading = false;

  String groupName = "";

  @override
  void initState() {
    super.initState();
    userData();
  }

  String getId(String res) {
    return res.substring(0, res.indexOf("_"));
  }

  String getName(String res) {
    return res.substring(res.indexOf("_") + 1);
  }

  userData() async {
    await SharedDataFunctions.getUserEmailFromSF().then((value) {
      setState(() {
        email = value!;
      });
    });
    await SharedDataFunctions.getUserNameFromSF().then((val) {
      setState(() {
        name = val!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 180,
            color: primaryColor.withOpacity(0.2),
            child: Column(
              children: [
                Icon(
                  Icons.account_circle,
                  size: 150,
                  color: primaryColor,
                ),
                Text(
                  name,
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.email,
              color: primaryColor,
            ),
            title: Text("Email"),
            subtitle: Text(
              email,
              style: TextStyle(color: Colors.black),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.menu_book,
              color: primaryColor,
            ),
            subtitle: Text("this is our...."),
            title: Text(
              "About",
              style: TextStyle(color: Colors.black),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: primaryColor,
            ),
            subtitle: Text("Change your app setting"),
            title: Text(
              "Setting",
              style: TextStyle(color: Colors.black),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            leading: Icon(
              Icons.call,
              color: primaryColor,
            ),
            subtitle: Text("Your Friends"),
            title: Text(
              "Invidual Chat",
              style: TextStyle(color: Colors.black),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GroupChatHomeScreen()),
              );
            },
            leading: Icon(
              Icons.group_add_outlined,
              color: primaryColor,
            ),
            subtitle: Text("Your Group"),
            title: Text(
              "Group Chat",
              style: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: MaterialButton(
              color: primaryColor,
              onPressed: () {
                authService.signOut(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => loginScreen()),
                );
              },
              child: Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
