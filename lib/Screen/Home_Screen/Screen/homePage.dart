import 'package:chatapp/Components/sharedPreferences.dart';
import 'package:chatapp/Constant/colors.dart';
import 'package:chatapp/Screen/Chat_Screen/IndividualChat_Screen/Screen/chatpage.dart';
import 'package:chatapp/Screen/Home_Screen/Widgets/drawer.dart';
import 'package:chatapp/Widgets/appbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String email = "";
  String userName = "";
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // @override
  // void initState() {
  //   super.initState();
  //   userData();
  // }

  // userData() async {
  //   await SharedDataFunctions.getUserEmailFromSF().then((value) {
  //     setState(() {
  //       email = value!;
  //     });
  //   });
  //   await SharedDataFunctions.getUserNameFromSF().then((val) {
  //     setState(() {
  //       userName = val!;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      drawer: Drawers(),
      key: _scaffoldKey,
      appBar: MyAppBar(
        scaffoldKey: _scaffoldKey,
      ),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Error');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading...');
        }
        final userCount = snapshot.data?.docs.length;

        return ListView(
          children: snapshot.data!.docs
              .map<Widget>((doc) => _buildUserListItem(doc, userCount!))
              .toList(),
        );
      },
    );
  }

  Widget _buildUserListItem(DocumentSnapshot document, int userCount) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    String userName = data['name'] ?? '';

    if (_auth.currentUser!.email != data['email']) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text(
                userCount.toString(),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            subtitle: Text(userName),
            title: Text(data['email']),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(
                    receiverUserEmail: data['email'],
                    receiverUserId: data['uid'],
                  ),
                ),
              );
            },
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
