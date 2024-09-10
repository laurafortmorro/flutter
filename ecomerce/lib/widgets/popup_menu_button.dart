import 'package:ecomerce/profile_screens/photo_edit.dart';
import 'package:ecomerce/profile_screens/profile_edit.dart';
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
          surfaceTintColor: Theme.of(context).colorScheme.onPrimary,
          onSelected: (OptionsItem item) {
            setState(() {
              selectedItem = item;
            });
          },
          icon: Icon(Icons.more_vert, color: Theme.of(context).colorScheme.primary),
          itemBuilder: (BuildContext context) => <PopupMenuEntry<OptionsItem>>[
             PopupMenuItem<OptionsItem>(
              value: OptionsItem.itemOne,
              onTap: () {
                  Navigator.of(
                    context).push(
                        MaterialPageRoute(
                          builder: (context) => ProfileEditPage(),
                        ),
                      );
                    },
              child: Text('Editar datos', style: TextStyle(color: Colors.black87)),
            ),
            PopupMenuItem<OptionsItem>(
              value: OptionsItem.itemTwo,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PhotoEditPage(),
                  ),
                );
              },
              child: Text('Subir foto', style: TextStyle(color: Colors.black87)),
            ),
          ],
        );
  }
}
