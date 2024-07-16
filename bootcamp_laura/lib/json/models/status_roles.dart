
class StatusRoles{
  final int id;
  final String name;

  StatusRoles({required this.id, required this.name});

  factory StatusRoles.fromJson(Map<String, dynamic> json){
    return StatusRoles(
        id: json['id'],
        name: json ['name']
    );
  }

}