

import 'package:bootcamp_laura/json/models/status_roles.dart';

class Rol{
  final int id;
  final String name;
  final String color;
  final String helper;
  late List<StatusRoles> statusRoles;

  Rol({required this.id, required this.name, required this.color, required this.helper, required this.statusRoles});


  factory Rol.fromJson(Map<String, dynamic> json){
    // Crear llista buida uxiliar
    // Recorrer atribut del JSON que és la llista
    // Anara afegint cada element de la llista del JSON a la llista auxiliar
    List<dynamic> jsonStatusRoles = json['status_roles'];
    List<StatusRoles> listStatusRoles= [];
    for(int i =0; i< jsonStatusRoles.length; i++){
      listStatusRoles.add(StatusRoles.fromJson(jsonStatusRoles[i]));
    }

    return Rol(
        id: json['id'],
        name: json['name'],
        color: json['color'],
        helper: json ['helper'],
      // Assignar el valor de la llista auxiliar a l'atribut de la classe (statusRoles)
      statusRoles: listStatusRoles,
    );
  }
}
