import 'package:bootcamp_laura/Chat/models/contact.dart';
import 'package:bootcamp_laura/Chat/widgets/message_field_box.dart';
import 'package:bootcamp_laura/Chat/widgets/my_chat_bubble.dart';
import 'package:bootcamp_laura/Chat/widgets/popup_menu_button.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatefulWidget {
  const ChatMessages({super.key, required this.contact});
  final Contact contact;

  @override
  State<ChatMessages> createState() => _ChatMessagesState();
}

class _ChatMessagesState extends State<ChatMessages>{
  late List<String> allMessagesList = ["Hola".toString(),];
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    allMessagesList = [];
    super.dispose();
  }

  @override
  void initState(){
    super.initState();
  }

  void handleTabChange (String message){
  setState(() {
    allMessagesList.add(message);
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        leading: BackButton(color: Colors.white),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.contact.image),
              backgroundColor: Colors.blue,
            ),
            SizedBox(width: 8),
            Text(
              widget.contact.name,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        actions: const [
          PopupMenuOptions()
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: allMessagesList.length,
                itemBuilder: (context, index) {
                  return MyChatBubble(textChat: allMessagesList[index]);
                }
            ),
          ),
           MessageFieldBox(textController: myController, addText: handleTabChange)
        ],
      ),
    );
  }
}