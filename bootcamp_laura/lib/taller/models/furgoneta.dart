import 'package:bootcamp_laura/taller/models/vehiculo.dart';

class Furgoneta extends Vehiculo{
  int numPuertas;
  int capacidadCarga;
  Furgoneta(super.tipoMotor, super.numRuedas, super.numPlazas, super.client, this.numPuertas, this.capacidadCarga);

  @override
  String toString() {
    return '${super.toString()} numPuertas: $numPuertas, capacidadCarga: $capacidadCarga';
  }
}