import 'package:bootcamp_laura/Chat/models/tab_options.dart';
import 'package:flutter/material.dart';

import 'package:bootcamp_laura/Chat/models/contact.dart';


class ContactCardPeticiones extends StatelessWidget {
  const ContactCardPeticiones({super.key, required this.activeTab, required this.contact, required this.onReject});
  final TabOptions activeTab;
  final Contact contact;
  final VoidCallback? onReject;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
          leading:  CircleAvatar(
            backgroundImage: NetworkImage(contact.image),
            backgroundColor: Colors.blue,
          ),
          title: Row(
            children: [
              Expanded(child: Text(contact.name, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 11))),
            ],
          ),
          subtitle: const Text('Texto inicio conversación...', style: TextStyle(fontSize: 9),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: onReject,
                child: const Text('RECHAZAR', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey)),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: (){},
                child: const Text('ACEPTAR', style: TextStyle(color: Colors.blueGrey)),
              ),
            ],
          )
      ),
    );
  }
}
