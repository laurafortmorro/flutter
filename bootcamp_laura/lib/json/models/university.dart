
class University{
  final int id;
  final String name;
  final String acronym;
  final int provinceId;
  final Map<String, dynamic> province;

  University({required this.id, required this.name, required this.acronym, required this.provinceId, required this.province,});

  factory University.fromJson(Map<String, dynamic>json){
    return University(
        id: json['id'],
        name: json['name'],
      acronym: json['acronym'],
        provinceId: json['province_id'],
      province: json['province']
    );
  }
}