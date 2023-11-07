import 'package:chatapp/Constant/image.dart';
import 'package:chatapp/Screen/Home_Screen/Screen/homePage.dart';
import 'package:chatapp/Widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/Screen/Home_Screen/body.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(AppImages.welcomebackground),
                Positioned(
                  bottom: 90,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 30),
                    child: DefaultButton(
                      text: "Private Conversation",
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  // top: 480,
                  bottom: 10,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 30),
                    child: DefaultButton(
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GroupChatHomeScreen()),
                        );
                      },
                      text: "GroupChat",
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
