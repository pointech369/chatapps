import 'package:chatapp/Components/sharedPreferences.dart';
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
          Spacer(),
          Container(
            height: 180,
            color: Colors.black26,
            child: Column(
              children: [
                Icon(
                  Icons.account_circle,
                  size: 150,
                  color: Colors.blueGrey,
                ),
                Text(
                  name,
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          Spacer(),
          ListTile(
            leading: Icon(Icons.email),
            title: Text("Email"),
            subtitle: Text(
              email,
              style: TextStyle(color: Colors.black),
            ),
          ),
          Spacer(),
          ListTile(
            leading: Icon(Icons.menu_book),
            subtitle: Text("this is our...."),
            title: Text(
              "About",
              style: TextStyle(color: Colors.black),
            ),
          ),
          Spacer(),
          ListTile(
            leading: Icon(Icons.settings),
            subtitle: Text("Change your app setting"),
            title: Text(
              "Setting",
              style: TextStyle(color: Colors.black),
            ),
          ),
          Spacer(),
          ListTile(
            leading: Icon(Icons.call),
            subtitle: Text("goooooooo"),
            title: Text(
              "Chat",
              style: TextStyle(color: Colors.black),
            ),
          ),
          Spacer(),
          SizedBox(
            height: 200,
          ),
          MaterialButton(
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
          Spacer(),
        ],
      ),
    );
  }
}
