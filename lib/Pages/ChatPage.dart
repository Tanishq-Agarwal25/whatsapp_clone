
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/CustomUI/CustomCard.dart';
import 'package:whatsapp_clone/Model/ChatModel.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with SingleTickerProviderStateMixin {
  List<ChatModel> chats = [
    ChatModel(
      name: "Samarth Bansal",
      isGroup: false,
      currentMessage: "Hi buddy",
      time: "5:00",
      icon: "person.svg",
    ),
    ChatModel(
      name: "Samarth Bansal",
      isGroup: false,
      currentMessage: "Hi buddy",
      time: "5:00",
      icon: "person.svg",
    ),
    ChatModel(
      name: "Samarth Bansal",
      isGroup: false,
      currentMessage: "Hi buddy",
      time: "5:00",
      icon: "person.svg",
    ),
    ChatModel(
      name: "Samarth Bansal",
      isGroup: false,
      currentMessage: "Hi buddy",
      time: "5:00",
      icon: "person.svg",
    ),
    ChatModel(
      name: "Samarth Bansal",
      isGroup: false,
      currentMessage: "Hi buddy",
      time: "5:00",
      icon: "person.svg",
    ),
  ];
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.chat),
    ),
      body: ListView(
        children: [
          CustomCard(),
          CustomCard(),
        ],
      )
    );
  }
}
