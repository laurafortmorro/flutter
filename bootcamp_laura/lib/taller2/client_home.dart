import 'package:bootcamp_laura/taller2/models/client_empresa.dart';
import 'package:bootcamp_laura/taller2/models/client_particular.dart';
import 'package:flutter/material.dart';

class ClientHome extends StatefulWidget {
  const ClientHome({super.key});

  @override
  State<ClientHome> createState() => _ClientHomeState();
}

class _ClientHomeState extends State<ClientHome> {
  late List<ClientParticular> listClientsParticular= [];
  late List<ClientEmpresa> listClientsEmpresa= [];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController telfController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  //controllers para los datos de empresa:
  final TextEditingController cifController = TextEditingController();
  final TextEditingController webController = TextEditingController();

  @override
  void dispose() {
    listClientsParticular = [];
    listClientsEmpresa = [];
    super.dispose();
  }

  @override
  void initState(){
    super.initState();
  }

  void handleTabChange (String message){
    setState(() {
      listClientsEmpresa.add(message as ClientEmpresa);
      listClientsParticular.add(message as ClientParticular);
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text('Información sobre el cliente', style: TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(height: 20),
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Nombre cliente',
                    suffixIcon:Padding(
                      padding: EdgeInsetsDirectional.only(end: 12.0),
                      child: Icon(Icons.person, color: Colors.blue),
                    ),
                  ),
                  controller: nameController,
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: surnameController,
                  decoration: const InputDecoration(
                    hintText: 'Apellido',
                    suffixIcon:Padding(
                      padding: EdgeInsetsDirectional.only(end: 12.0),
                      child: Icon(Icons.person_2_outlined, color: Colors.blue),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: telfController,
                  decoration: const InputDecoration(
                    hintText: 'Teléfono',
                    suffixIcon:Padding(
                      padding: EdgeInsetsDirectional.only(end: 12.0),
                      child: Icon(Icons.mobile_friendly_outlined, color: Colors.blue),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    suffixIcon:Padding(
                      padding: EdgeInsetsDirectional.only(end: 12.0),
                      child: Icon(Icons.email, color: Colors.blue),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Text('Si eres una empresa rellena los siguientes datos:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                TextField(
                  controller: cifController,
                  decoration: const InputDecoration(
                    hintText: 'CIF',
                    suffixIcon:Padding(
                      padding: EdgeInsetsDirectional.only(end: 12.0),
                      child: Icon(Icons.business, color: Colors.blue),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: webController,
                  decoration: const InputDecoration(
                    hintText: 'WEB',
                    suffixIcon:Padding(
                      padding: EdgeInsetsDirectional.only(end: 12.0),
                      child: Icon(Icons.web, color: Colors.blue),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size(350, 50),
                  ),
                  onPressed: () {
                    int index;
                    //fer un condicional que si s'omple els apartats de CIF i web s'afegeixi el contacte a Empresa sino a Particulars

                    if(cifController.text.isNotEmpty && webController.text.isNotEmpty){
                      ClientEmpresa clientEmpresa= ClientEmpresa(nameController.text, telfController.text, emailController.text, cifController.text, webController.text);
                      listClientsEmpresa.add(clientEmpresa);
                      print('es una empresa');
                    }else{
                      ClientParticular clientParticular= ClientParticular(nameController.text, telfController.text, emailController.text, surnameController.text);
                      listClientsParticular.add(clientParticular);
                      print('es un particular');
                    }
                    nameController.clear();
                    surnameController.clear();
                    telfController.clear();
                    emailController.clear();
                    cifController.clear();
                    webController.clear();
                    setState(() {});
                  },
                  child: const Text('Guardar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 30),
                Text('LISTA PARTICULARES', style: TextStyle(fontWeight: FontWeight.bold),),
                ListView.builder(
                  shrinkWrap: true,
                    itemCount: listClientsParticular.length,
                    itemBuilder: (context, index){
                    return ListTile(
                      title: Text('Particular ${index+1}: ${listClientsParticular[index]}'),
                    );

                    }
                ),
                SizedBox(height: 30),
                Text('LISTA EMPRESAS', style: TextStyle(fontWeight: FontWeight.bold),),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: listClientsEmpresa.length,
                    itemBuilder: (context, index){
                      return ListTile(
                        title: Text('Particular ${index+1}: ${listClientsEmpresa[index]}'),
                      );
                    }
                )
              ],
            )
          ),
        ),
      ),
    );
  }

}
