
class Degree{
  final int id;
  final String name;
  final String abbreviation;

  Degree({required this.id, required this.name, required this.abbreviation});

  factory Degree.fromJson(Map<String, dynamic>json){
    return Degree(
      id: json['id'],
      name: json['name'],
        abbreviation: json['abbreviation']
    );
  }
}