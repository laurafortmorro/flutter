import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
   MessageFieldBox({super.key, required this.textController, required this.addText});
   late TextEditingController textController = TextEditingController();
   final Function(String) addText;

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
          final textValue = textController.text;
          if (textValue.isNotEmpty) {
            addText(textValue);
            textController.clear();
          }

        },
      ),
    );

    return TextFormField(
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