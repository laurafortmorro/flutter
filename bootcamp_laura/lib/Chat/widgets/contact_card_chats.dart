import 'package:bootcamp_laura/Chat/chat_messages.dart';
import 'package:bootcamp_laura/Chat/models/contact.dart';
import 'package:flutter/material.dart';
import '../models/tab_options.dart';


class ContactCardChats extends StatelessWidget {
  const ContactCardChats({super.key, required this.contact, required this.activeTab});
  final TabOptions activeTab;
  final Contact contact;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
          Navigator.push(context,
            MaterialPageRoute(builder: (context)=> ChatMessages(contact: contact)),
          );
      },
      child: Card(
        color: Colors.white,
        child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(contact.image),
              backgroundColor: Colors.blue,
            ),
            title: Row(
              children: [
                Expanded(child: Text(contact.name, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 11))),
                Text(contact.date,style: TextStyle(color: Colors.blueGrey, fontSize: 8), textAlign: TextAlign.left)
              ],
            ),
            subtitle: const Text('Texto inicio conversación...', style: TextStyle(fontSize: 9),
            ),

        ),
      ),
    );
  }
}
