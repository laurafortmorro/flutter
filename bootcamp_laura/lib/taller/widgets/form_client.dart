import 'package:flutter/material.dart';

class FormClient extends StatelessWidget {
  FormClient({super.key, required this.nameController, required this.surnameController, required this.telfController, required this.emailController});
 late TextEditingController nameController;
 late TextEditingController surnameController;
 late TextEditingController telfController;
 late TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Text('Información sobre el cliente', style: TextStyle(fontWeight: FontWeight.bold),),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            hintText: 'Nombre cliente',
            suffixIcon:Padding(
              padding: EdgeInsetsDirectional.only(end: 12.0),
              child: Icon(Icons.person, color: Colors.blue),
            ),
          ),
          controller: nameController,
        ),
        SizedBox(height: 30),
        TextField(
          controller: surnameController,
          decoration: InputDecoration(
            hintText: 'Apellido',
            suffixIcon:Padding(
              padding: EdgeInsetsDirectional.only(end: 12.0),
              child: Icon(Icons.person_2_outlined, color: Colors.blue),
            ),
          ),
        ),
        SizedBox(height: 30),
        TextField(
          controller: telfController,
          decoration: InputDecoration(
            hintText: 'Teléfono',
            suffixIcon:Padding(
              padding: EdgeInsetsDirectional.only(end: 12.0),
              child: Icon(Icons.mobile_friendly_outlined, color: Colors.blue),
            ),
          ),
        ),
        SizedBox(height: 30),
        TextField(
          controller: emailController,
          decoration: InputDecoration(
            hintText: 'Email',
            suffixIcon:Padding(
              padding: EdgeInsetsDirectional.only(end: 12.0),
              child: Icon(Icons.email, color: Colors.blue),
            ),
          ),
        ),
      ],

    );
  }
}
