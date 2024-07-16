import 'package:bootcamp_laura/Chat/models/tab_options.dart';
import 'package:bootcamp_laura/Chat/widgets/contact_card_chats.dart';
import 'package:bootcamp_laura/Chat/widgets/contact_card_peticiones.dart';
import 'package:flutter/material.dart';
import 'models/contact.dart';


class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  late List<Contact> allContactsList = [
    Contact('Joan Pérez', DateTime.now().toString().split(' ').first, 'https://img.freepik.com/vector-premium/perfil-avatar-hombre-icono-redondo_24640-14044.jpg'),
    Contact('Sara Pérez', DateTime.now().toString().split(' ').first, 'https://img.freepik.com/vector-premium/perfil-avatar-mujer-icono-redondo_24640-14042.jpg'),
    Contact('Ana díaz', DateTime.now().toString().split(' ').first, 'https://img.freepik.com/vector-premium/perfil-avatar-mujer-icono-redondo_24640-14042.jpg'),
    Contact('Ángel López', DateTime.now().toString().split(' ').first, 'https://img.freepik.com/vector-premium/perfil-avatar-hombre-icono-redondo_24640-14044.jpg'),
    Contact('Paula González', DateTime.now().toString().split(' ').first, 'https://img.freepik.com/vector-premium/perfil-avatar-mujer-icono-redondo_24640-14042.jpg'),
    Contact('Sandra Pérez', DateTime.now().toString().split(' ').first, 'https://img.freepik.com/vector-premium/perfil-avatar-mujer-icono-redondo_24640-14042.jpg'),
    Contact('Hermano', DateTime.now().toString().split(' ').first, 'https://img.freepik.com/vector-premium/perfil-avatar-hombre-icono-redondo_24640-14044.jpg'),
    Contact('Hermana', DateTime.now().toString().split(' ').first, 'https://img.freepik.com/vector-premium/perfil-avatar-mujer-icono-redondo_24640-14042.jpg'),
    Contact('Pepe Pérez', DateTime.now().toString().split(' ').first, 'https://img.freepik.com/vector-premium/perfil-avatar-hombre-icono-redondo_24640-14044.jpg'),
    Contact('Joana Pérez', DateTime.now().toString().split(' ').first, 'https://img.freepik.com/vector-premium/perfil-avatar-mujer-icono-redondo_24640-14042.jpg'),
    Contact('Hermana', DateTime.now().toString().split(' ').first, 'https://img.freepik.com/vector-premium/perfil-avatar-mujer-icono-redondo_24640-14042.jpg'),
    Contact('Pepe Pérez', DateTime.now().toString().split(' ').first, 'https://img.freepik.com/vector-premium/perfil-avatar-hombre-icono-redondo_24640-14044.jpg'),
  ];
  late List<Contact> filteredContactsList;

  @override
  void initState(){
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _tabController.addListener(_handleTabChange);
    allContactsList = List.from(allContactsList);
    filteredContactsList = allContactsList;
  }
  @override
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabChange(){
    setState(() {
    });
  }
  void removeContact(Contact contact) {
    setState(() {
      allContactsList.remove(contact);
      filteredContactsList = List.from(allContactsList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        leading: IconButton(
          icon: Icon(Icons.search, color: Colors.white),
          onPressed: (){
          },
        ),
        title: TextField(
          cursorColor: Colors.white60,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
              focusColor: Colors.white,
              hoverColor: Colors.white,
              hintText: 'Buscar por nombre...',
              hintStyle: TextStyle(color: Colors.white),
              border: InputBorder.none,),
          onChanged: (value) {
            setState(() {
              filteredContactsList = allContactsList.where((contact) =>
                  contact.name.toLowerCase().contains(value.toLowerCase()))
                  .toList();
            });
          },
        ),
        bottom: TabBar(
          controller: _tabController,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(text: TabOptions.CHATS.toString().split('.').last),
              Tab(text: TabOptions.PETICIONES.toString().split('.').last),
        ],
        ),
      ),
      body: ListView.builder(
        itemCount: filteredContactsList.length,
          itemBuilder: (context, index) {
          final activeTab = _tabController.index == 0 ? TabOptions.CHATS : TabOptions.PETICIONES;
          return activeTab == TabOptions.CHATS?
          ContactCardChats(activeTab: activeTab, contact: filteredContactsList[index])
              : ContactCardPeticiones(activeTab: activeTab, contact: filteredContactsList[index], onReject: () { removeContact(filteredContactsList[index]); }, );
          }
      ),

    );
  }
}
