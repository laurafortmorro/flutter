class Client{
  final String name;
  final String telephone;
  final String? email;
  Client(this.name, this.telephone, this.email);

  @override
  String toString() {
    return 'name: $name, telephone: $telephone, email: $email';
  }
}