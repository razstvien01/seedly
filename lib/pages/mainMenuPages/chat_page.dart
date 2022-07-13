//* This .dart file is used for designing Chat page UI in main menu folder

import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Chat', style: TextStyle(fontSize: 72),),);
  }
}