import 'package:flutter/material.dart';

class FormVechicle extends StatelessWidget {
  FormVechicle({super.key, required this.wheelsController, required this.placesController, required this.typeMotorController});
  late TextEditingController typeMotorController;
  late TextEditingController placesController;
  late TextEditingController wheelsController;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Text('Información sobre el vehículo', style: TextStyle(fontWeight: FontWeight.bold),),
        SizedBox(height: 20),
        TextField(
          controller: typeMotorController,
          decoration: InputDecoration(
            hintText: 'Tipo de motor',
            suffixIcon:Padding(
              padding: EdgeInsetsDirectional.only(end: 12.0),
              child: Icon(Icons.motion_photos_on_rounded, color: Colors.blue),
            ),
          ),
        ),
        SizedBox(height: 30),
        TextField(
          controller: placesController,
          decoration: InputDecoration(
            hintText: 'número de plazas',
            suffixIcon:Padding(
              padding: EdgeInsetsDirectional.only(end: 12.0),
              child: Icon(Icons.car_crash_outlined, color: Colors.blue),
            ),
          ),
        ),
        SizedBox(height: 30),
        TextField(
          controller: wheelsController,
          decoration: InputDecoration(
            hintText: 'número de ruedas',
            suffixIcon:Padding(
              padding: EdgeInsetsDirectional.only(end: 12.0),
              child: Icon(Icons.car_repair, color: Colors.blue),
            ),
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
