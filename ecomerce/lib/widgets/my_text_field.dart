import 'package:flutter/material.dart';


//aconseguir que els Textfields estiguin omplerts només començar amb les dades actuals
//https://medium.com/comunidad-flutter/flutter-textfield-una-vista-detallada-1833c4488785


class MyTextField extends StatelessWidget {
  MyTextField({super.key, required this.nameController, required this.hintText, required this.icon
  });
  final TextEditingController nameController;
  late Icon icon;
  late String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        controller: nameController,
        style:
        TextStyle(
            color: Colors.black
        ),
        decoration: InputDecoration(

            constraints: BoxConstraints(
                maxWidth: double.maxFinite
            ),
            filled: true,
            hintText: hintText,
            fillColor: Theme.of(context).colorScheme.onPrimary,
            prefixIcon: icon
        ),

      ),
    );
  }
}
