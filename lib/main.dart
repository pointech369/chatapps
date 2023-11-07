import 'package:chatapp/Constant/colors.dart';
import 'package:chatapp/Screen/Home_Screen/Screen/homePage.dart';
import 'package:chatapp/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Components/sharedPreferences.dart';
import 'Screen/Home_Screen/body.dart';
import 'Screen/Login_Screen/body.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;

  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    await SharedDataFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        iconTheme: IconThemeData(),
        // appBarTheme: AppBarTheme(color: ksprimaryColor, elevation: 10),
        scaffoldBackgroundColor: kbgColor,
      ),
      home: _isSignedIn ? HomePage() : loginScreen(),
    );
  }
}
