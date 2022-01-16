
import 'dart:convert';

List<Catagories> catagoriesFromJson(String str) => List<Catagories>.from(json.decode(str).map((x) => Catagories.fromJson(x)));

String catagoriesToJson(List<Catagories> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Catagories {
  Catagories({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
  });

  int id;
  String name;
  String image;
  String description;

  factory Catagories.fromJson(Map<String, dynamic> json) => Catagories(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "description": description,
  };
}
