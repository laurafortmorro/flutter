/*
import 'package:flutter/material.dart';

*/
/*
ListView(
children: [
BubbleSpecialThree(
text: 'Added iMessage shape bubbles',
color: Color(0xAC6887B6),
tail: true,
textStyle: TextStyle(
color: Colors.white,
fontSize: 16,
),
),
BubbleSpecialThree(
text: 'ok!',
color: Color(0xFFE8E8EE),
tail: true,
isSender: false,
delivered: true,
),
BubbleSpecialThree(
text: 'Please try and give some feedback on it!',
color: Color(0xAC6887B6),
tail: true,
textStyle: TextStyle(
color: Colors.white,
fontSize: 16,
),
),
BubbleSpecialThree(
text: 'Sure',
color: Color(0xFFE8E8EE),
tail: true,
isSender: false,
),
BubbleSpecialThree(
text: "I tried. It's awesome!!!",
color: Color(0xFFE8E8EE),
tail: true,
isSender: false,
),
BubbleSpecialThree(
text: "Thanks",
color: Color(0xFFE8E8EE),
tail: true,
isSender: false,
),

],
),

https://docs.google.com/document/d/12-Fij-gzCLhqGS2Xc69cX4IPFwQ_bcHyYlgwpVNg20o/edit?usp=sharing
*//*


import 'package:flutter/material.dart';


class MessageFieldBox extends StatelessWidget {
  MessageFieldBox({super.key, required this.textController, required this.onChanged});
  late TextEditingController textController = TextEditingController();
  late ValueChanged<String>? onChanged;


  @override
  Widget build(BuildContext context) {
    final focusNode = FocusNode();


    const outlineInputBorder = UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent));


    final inputDecoration = InputDecoration(
      hintStyle: TextStyle(color: Color(0xAC6887B6)),
      fillColor: Color(0xFFE8E8EE),
      hintText: 'Escribir...',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: Icon(Icons.send, color: Color(0xAC6887B6)),
        onPressed: () {
          final textValue = textController.value.text;
          print('button: $textValue');
          textController.clear();
        },
      ),
    );


    return TextFormField(
      onChanged: onChanged,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        print('Submit value $value');
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}

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


class _ChatMessagesState extends State<ChatMessages> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<String> allMessagesList = [
    Text('Hola').toString().split('(').last,
    Text('Una prueba').toString(),
    Text('Conversación').toString()
  ];
  final myController = TextEditingController();


  @override
  void dispose() {
    myController.dispose();
    _tabController = TabController(vsync: this, length: 2);
    _tabController.addListener(_handleTabChange);
    super.dispose();
  }


  void initState(){
    super.initState();
  }
  void _handleTabChange(){
    setState(() {
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
          MessageFieldBox(
            textController: myController,
            onChanged: (valor) => setState((){
              allMessagesList.add(valor);
            }),




          ),
        ],
      ),
    );
  }
}






_—----------------




class MessageFieldBox extends StatelessWidget {
  MessageFieldBox({Key? key, required this.onSendMessage});

  final Function(String) onSendMessage;


  late TextEditingController textController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(Icons.send),
          onPressed: () {
            final textValue = textController.text;
            if (textValue.isNotEmpty) {
              onSendMessage(textValue);
              textController.clear();
            }
          },
        ),
      ),
    );
  }
}



class ChatMessages extends StatefulWidget {
  const ChatMessages({Key? key, required this.contact}) : super(key: key);

  final Contact contact;

  @override
  State<ChatMessages> createState() => _ChatMessagesState();
}

class _ChatMessagesState extends State<ChatMessages> {
  late List<String> allMessagesList;

  @override
  void initState() {
    super.initState();
    allMessagesList = [];
  }

  void handleSendMessage(String message) {
    setState(() {
      allMessagesList.add(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: allMessagesList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(allMessagesList[index]),
                );
              },
            ),
          ),
          MessageFieldBox(onSendMessage: handleSendMessage),
        ],
      ),
    );
  }
}



// Modelo para representar los datos de la furgoneta
class Furgoneta {
  String marca;
  String modelo;

  Furgoneta({required this.marca, required this.modelo});
}

class _WorkshopPageState extends State<WorkshopPage> {
  VehicleType? _selectedVehicleType;
  final TextEditingController _marcaController = TextEditingController();
  final TextEditingController _modeloController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Taller de Coches'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selecciona el tipo de vehículo:',
              style: TextStyle(fontSize: 18.0),
            ),
            DropdownButton<VehicleType>(
              value: _selectedVehicleType,
              onChanged: (VehicleType? newValue) {
                setState(() {
                  _selectedVehicleType = newValue;
                });
              },
              items: VehicleType.values.map((VehicleType value) {
                return DropdownMenuItem<VehicleType>(
                  value: value,
                  child: Text(value.toString().split('.')[1]),
                );
              }).toList(),
            ),
            SizedBox(height: 20.0),
            _selectedVehicleType != null
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildFieldsForVehicleType(_selectedVehicleType!),
            )
                : SizedBox(),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Guardar la información introducida y crear la instancia del modelo
                if (_selectedVehicleType == VehicleType.Furgoneta) {
                  Furgoneta furgoneta = Furgoneta(
                    marca: _marcaController.text,
                    modelo: _modeloController.text,
                  );
                  // Aquí puedes hacer lo que quieras con la instancia de la furgoneta
                  print('Furgoneta: ${furgoneta.marca} - ${furgoneta.modelo}');
                }
              },
              child: Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildFieldsForVehicleType(VehicleType vehicleType) {
    List<Widget> fields = [];

    switch (vehicleType) {
      case VehicleType.Coche:
      // Construir campos para Coche
        break;
      case VehicleType.Furgoneta:
        fields.add(TextFormField(
          controller: _marcaController,
          decoration: InputDecoration(labelText: 'Marca'),
        ));
        fields.add(TextFormField(
          controller: _modeloController,
          decoration: InputDecoration(labelText: 'Modelo'),
        ));
        break;
      case VehicleType.Camion:
      // Construir campos para Camion
        break;
      case VehicleType.Moto:
      // Construir campos para Moto
        break;
    }

    return fields;
  }
}










*/
