import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class MyChatBubble extends StatelessWidget {
   MyChatBubble({super.key, required this.textChat});
  late String textChat;

  @override
  Widget build(BuildContext context) {
    return BubbleSpecialThree(
      text: textChat,
      color: Color(0xAC6887B6),
      tail: true,
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    );
  }
}
