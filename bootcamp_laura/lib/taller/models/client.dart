
class Client {
  late String name;
  late String surname;
  late int telephone;
  late String email;

  Client(this.name, this.surname, this.telephone, this.email);

  @override
  String toString() {
    return 'Client name: $name, surname: $surname, telephone: $telephone, email: $email∫';
  }
}
