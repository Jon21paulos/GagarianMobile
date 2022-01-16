// To parse this JSON data, do
//
//     final item = itemFromJson(jsonString);

import 'dart:convert';

Item itemFromJson(String str) => Item.fromJson(json.decode(str));

String itemToJson(Item data) => json.encode(data.toJson());

class Item {
  Item({
    this.count,
    this.next,
    this.previous,
    required this.results,
  });

  int? count;
  String? next;
  dynamic previous;
  List<Result> results;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    required this.id,
     this.name,
     this.nameLocale,
     this.slug,
     this.tag,
     this.available,
     this.price,
     this.image1,
     this.image2,
     this.image3,
     this.description,
     required this.category,
  });

  int? id;
  String? name;
  String? nameLocale;
  String? slug;
  String? tag;
  bool? available;
  String? price;
  String? image1;
  String? image2;
  String? image3;
  String? description;
  Category category;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    name: json["name"],
    nameLocale: json["name_locale"],
    slug: json["slug"],
    tag: json["tag"],
    available: json["available"],
    price: json["price"],
    image1: json["image1"],
    image2: json["image2"],
    image3: json["image3"],
    description: json["description"],
    category: Category.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name_locale": nameLocale,
    "slug": slug,
    "tag": tag,
    "available": available,
    "price": price,
    "image1": image1,
    "image2": image2,
    "image3": image3,
    "description": description,
    "category": category.toJson(),
  };
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
  });

  int id;
  String name;
  String image;
  String description;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
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
