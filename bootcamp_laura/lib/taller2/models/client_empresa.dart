import 'package:bootcamp_laura/taller2/models/client.dart';

class ClientEmpresa extends Client{
  ClientEmpresa(super.name, super.telephone, super.email, this.cif, this.web);
  final String cif;
  final String web;

  @override
  String toString() {
    return '${super.toString()} cif: $cif, web: $web';
  }
}