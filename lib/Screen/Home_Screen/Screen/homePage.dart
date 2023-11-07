import 'package:chatapp/Components/sharedPreferences.dart';
import 'package:chatapp/Constant/colors.dart';
import 'package:chatapp/Screen/Chat_Screen/chatpage.dart';
import 'package:chatapp/Service/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String email = "";
  String userName = "";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    userData();
  }

  userData() async {
    await SharedDataFunctions.getUserEmailFromSF().then((value) {
      setState(() {
        email = value!;
      });
    });
    await SharedDataFunctions.getUserNameFromSF().then((val) {
      setState(() {
        userName = val!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Your Friends List '),
        actions: [
          IconButton(
              onPressed: () {
                AuthService().signOut(context);
              },
              icon: Icon(Icons.logout))
        ],
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
        final userCount =
            snapshot.data?.docs.length; // Calculate the user count

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

    // Check if the 'name' field is not null
    String userName =
        data['name'] ?? ''; // Use an empty string if 'name' is null

    if (_auth.currentUser!.email != data['email']) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.black12,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor:
                  Colors.blue, // Set the background color of the avatar
              child: Text(
                userCount.toString(), // Display the user count as text
                style: TextStyle(
                  color: Colors.white, // Set the text color
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
