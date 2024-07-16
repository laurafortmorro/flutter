import 'package:flutter/material.dart';

enum OptionsItem { itemOne, itemTwo }

class PopupMenuOptions extends StatefulWidget {
  const PopupMenuOptions({super.key});

  @override
  State<PopupMenuOptions> createState() => _PopupMenuOptionsState();
}

class _PopupMenuOptionsState extends State<PopupMenuOptions> {
  OptionsItem? selectedItem;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<OptionsItem>(
          initialValue: selectedItem,
          surfaceTintColor: Colors.white,
          onSelected: (OptionsItem item) {
            setState(() {
              selectedItem = item;
            });
          },
          icon: Icon(Icons.more_vert, color: Colors.white),
          itemBuilder: (BuildContext context) => <PopupMenuEntry<OptionsItem>>[
            const PopupMenuItem<OptionsItem>(
              value: OptionsItem.itemOne,
              child: Text('Bloquear usuario', style: TextStyle(color: Colors.grey)),
            ),
            const PopupMenuItem<OptionsItem>(
              value: OptionsItem.itemTwo,
              child: Text('Eliminar chat', style: TextStyle(color: Colors.grey)),
            ),
          ],
        );
  }
}
