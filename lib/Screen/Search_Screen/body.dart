// import 'package:chatapp/Screen/Search_Screen/Screen/search_Screen.dart';
// import 'package:chatapp/Widgets/appbar.dart';
// import 'package:chatapp/main.dart';
// import 'package:flutter/material.dart';

// import '../../Constant/colors.dart';
// import '../../Service/auth.dart';
// import '../Login_Screen/body.dart';

// class SearchScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//     AuthService authService = AuthService();
//     return Scaffold(
//         // drawer: Drawer(
//         //   child: Column(
//         //     mainAxisAlignment: MainAxisAlignment.center,
//         //     crossAxisAlignment: CrossAxisAlignment.center,
//         //     children: [
//         //       MaterialButton(
//         //         color: primaryColor,
//         //         onPressed: () {
//         //           authService.signOut();
//         //           Navigator.pushReplacement(
//         //             context,
//         //             MaterialPageRoute(builder: (context) => loginScreen()),
//         //           );
//         //         },
//         //         child: Text(
//         //           "Logout",
//         //           style: TextStyle(color: Colors.white),
//         //         ),
//         //       )
//         //     ],
//         //   ),
//         // ),
//         key: _scaffoldKey,
//         appBar: MyAppBar(
//           scaffoldKey: _scaffoldKey,
//         ),
//         body: Body());
//   }
// }
