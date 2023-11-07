import 'package:chatapp/Constant/colors.dart';
import 'package:chatapp/Screen/Chat_Screen/GroupChat_Screen/Screen/groupChat_Screen.dart';
import 'package:chatapp/Widgets/group_info.dart';
import 'package:flutter/material.dart';

class IndividualChatScreen extends StatefulWidget {
  final String groupId;
  final String groupName;
  final String userName;
  const IndividualChatScreen(
      {Key? key,
      required this.groupId,
      required this.groupName,
      required this.userName})
      : super(key: key);
  @override
  State<IndividualChatScreen> createState() => _IndividualChatScreenState();
}

class _IndividualChatScreenState extends State<IndividualChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(widget.groupName),
        backgroundColor: primaryColor,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GroupInfo(
                            groupId: widget.groupId,
                            groupName: widget.groupName,
                            adminName: '',
                          )),
                );
              },
              icon: const Icon(Icons.info))
        ],
      ),
      body: Body(
        groupId: widget.groupId,
        userName: widget.userName,
        groupName: widget.groupName,
      ),
    );
  }
}
