class Location{
  double latitude;
  double longitude;

  Location({required this.latitude, required this.longitude});

  factory Location.fromJson(Map<String, dynamic> json){
    return Location(
        latitude: json['latitude'],
        longitude: json['longitude']
    );
  }
}