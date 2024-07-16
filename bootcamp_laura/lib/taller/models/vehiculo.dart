import 'package:bootcamp_laura/taller/models/tipo_motor.dart';

import 'client.dart';

abstract class Vehiculo{
  late TipoMotor tipoMotor;
  late int numRuedas;
  late int numPlazas;
  late Client client;

  Vehiculo(this.tipoMotor, this.numRuedas, this.numPlazas, this.client);

  @override
  String toString() {
    return '${super.toString()} $tipoMotor, numRuedas: $numRuedas, numPlazas: $numPlazas, client: $client';
  }
}