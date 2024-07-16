
import 'package:bootcamp_laura/taller/models/furgoneta.dart';
import 'package:bootcamp_laura/taller/models/motocicleta.dart';
import 'package:bootcamp_laura/taller/models/client.dart';
import 'package:bootcamp_laura/taller/models/tipo_motor.dart';
import 'package:bootcamp_laura/taller/models/tipo_vehiculo.dart';
import 'package:bootcamp_laura/taller/widgets/form_client.dart';
import 'package:bootcamp_laura/taller/widgets/form_vehicle.dart';
import 'package:flutter/material.dart';

import 'models/vehiculo.dart';

//Saber com guardar info textfields a partir de les clases creades

class HomePageTaller extends StatefulWidget {
  const HomePageTaller({super.key});

  @override
  State<HomePageTaller> createState() => _HomePageTallerState();

}

class _HomePageTallerState extends State<HomePageTaller> {
  TipoVehiculo? tipoVehiculo;
  //listas para guardar los datos introducidos
  late List<Motocicleta> listMotocicleta= [];
   //controllers del form de cliente
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController telfController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  //controllers vehicle en general
  final TextEditingController typeMotorController= TextEditingController();
  final TextEditingController placesController= TextEditingController();
  final TextEditingController wheelsController= TextEditingController();

  @override
  void dispose() {
    listMotocicleta= [];
    super.dispose();
  }

  @override
  void initState(){
    super.initState();
  }

  void handleTabChange (String message){
    setState(() {
      listMotocicleta.add(message as Motocicleta);
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Introduce tu vehículo'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                    value: tipoVehiculo,
                    items: TipoVehiculo.values.map((TipoVehiculo vehiculo){
                      return DropdownMenuItem(
                          value: vehiculo,
                          child: Text(vehiculo.toString().split('.').last));
                    }).toList(),
                    onChanged: (TipoVehiculo? newvalue) {
                      setState(() {
                        tipoVehiculo= newvalue;
                      });
                    },
                  ),
                ),
                FormClient(nameController: nameController, surnameController: surnameController, telfController: telfController, emailController: emailController),
                FormVechicle(wheelsController: wheelsController, placesController: placesController, typeMotorController: typeMotorController),
                SizedBox(height: 20),
                tipoVehiculo!= null
                    ? Column(
                  children: _buildFieldsForVehicleType(tipoVehiculo!),
                )

                    : SizedBox(height: 50,),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: const Size(350, 50),
                    ),
                    onPressed: () {
                      if(tipoVehiculo== TipoVehiculo.MOTOCICLETA) {
                        Client client= Client(nameController.text, surnameController.text, telfController.hashCode, emailController.text);
                        Motocicleta motocicleta= Motocicleta(TipoMotor.COMBUSTIO, placesController.hashCode, wheelsController.hashCode, client);
                        listMotocicleta .add(motocicleta);
                      }
                      setState(() {});

                    },
                    child: const Text('Guardar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),

                SizedBox(height: 30),
                Text('LISTA MOTCCICLETAS', style: TextStyle(fontWeight: FontWeight.bold),),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: listMotocicleta.length,
                    itemBuilder: (context, index){
                      return ListTile(
                        title: Text('Motocicleta ${index+1}: ${listMotocicleta[index]}'),
                      );

                    }
                ),
              ],
            ),
          ),
        ),

      ),
    );
  }
  List<Widget> _buildFieldsForVehicleType(TipoVehiculo tipoVehiculo) {
    List<Widget> fields = [];

    switch (tipoVehiculo) {
      case TipoVehiculo.TURISMO:
        fields.add(
            TextField(decoration: InputDecoration(
              hintText: 'Número de puertas',
              suffixIcon:Padding(
                padding: EdgeInsetsDirectional.only(end: 12.0),
                child: Icon(Icons.motion_photos_on_rounded, color: Colors.blue),
              ),
            ),
            ));
        break;

      case TipoVehiculo.FURGONETA:
        fields.add(
            TextField(decoration: InputDecoration(
              hintText: 'Número de puertas',
              suffixIcon:Padding(
                padding: EdgeInsetsDirectional.only(end: 12.0),
                child: Icon(Icons.motion_photos_on_rounded, color: Colors.blue),
              ),
            ),
            ));
        fields.add(
            TextField(decoration: InputDecoration(
              hintText: 'Capacidad máxima de carga',
              suffixIcon:Padding(
                padding: EdgeInsetsDirectional.only(end: 12.0),
                child: Icon(Icons.motion_photos_on_rounded, color: Colors.blue),
              ),
            ),
            ));
        break;
      case TipoVehiculo.CICLOMOTOR:
      case TipoVehiculo.MOTOCICLETA:
    }

    return fields;
  }

}

