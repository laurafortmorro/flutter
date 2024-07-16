
import 'package:bootcamp_laura/taller/models/vehiculo.dart';

class Turismo extends Vehiculo{
  int numPuertas;
  Turismo(super.tipoMotor, super.numRuedas, super.numPlazas, super.client, this.numPuertas);
}