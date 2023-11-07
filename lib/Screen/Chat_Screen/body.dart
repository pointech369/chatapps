import 'package:chatapp/Screen/Chat_Screen/Screen/chat_Screen.dart';
import 'package:chatapp/Widgets/group_info.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String groupId;
  final String groupName;
  final String userName;
  const ChatScreen(
      {Key? key,
      required this.groupId,
      required this.groupName,
      required this.userName})
      : super(key: key);
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(widget.groupName),
        backgroundColor: Theme.of(context).primaryColor,
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
