class CharacterModel {
  String name;
  String status;
  String type;
  String image;
  Map lastKnownLocation;

  CharacterModel({
    required this.name,
    required this.status,
    required this.type,
    required this.image,
    required this.lastKnownLocation,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      name: json['name'],
      status: json['status'],
      type: json['type'],
      image: json['image'],
      lastKnownLocation: json['location'],
    );
  }
}
