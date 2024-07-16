import 'package:bootcamp_laura/Chat/chat_messages.dart';
import 'package:bootcamp_laura/Chat/models/tab_options.dart';
import 'package:flutter/material.dart';


/*
class ContactCard extends StatefulWidget {
  const ContactCard({super.key, required this.activeTab});
  final TabOptions activeTab;

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  bool _showOptions = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(widget.activeTab == TabOptions.CHATS){
          Navigator.push(context,
            MaterialPageRoute(builder: (context)=> const ChatMessages()),
          );
        }else {
          setState(() {
            _showOptions = !_showOptions;
          });
        }
        
      },
      child: Card(
              color: Colors.white,
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundImage: NetworkImage('https://img.freepik.com/vector-premium/perfil-avatar-hombre-icono-redondo_24640-14044.jpg'),
                  backgroundColor: Colors.blue,
                ),
                title: const Row(
                  children: [
                    Expanded(child: Text('Nombre contacto  ', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 11))),
                    Text('11/4/2024',style: TextStyle(color: Colors.blueGrey, fontSize: 8), textAlign: TextAlign.left)
                  ],
                ),
                subtitle: const Text('Texto inicio conversación...', style: TextStyle(fontSize: 9),
                ),
                trailing: widget.activeTab == TabOptions.PETICIONES && _showOptions
                    ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: (){},
                          child: const Text('RECHAZAR', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey)),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: (){},
                          child: const Text('ACEPTAR', style: TextStyle(color: Colors.blueGrey)),
                        ),
                      ],
                    )
                    : null
              ),
            ),
    );
  }
}
*/
