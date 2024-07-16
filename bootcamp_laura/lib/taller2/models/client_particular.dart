import 'package:bootcamp_laura/taller2/models/client.dart';

class ClientParticular extends Client{
  ClientParticular(super.name, super.telephone, super.email, this.surname);
  final String surname;

  @override
  String toString() {
    return 'surname: $surname, ${super.toString()}';
  }
}