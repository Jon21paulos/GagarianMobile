// To parse this JSON data, do
//
//     final usersData = usersDataFromJson(jsonString);

import 'dart:convert';

UsersData usersDataFromJson(String str) => UsersData.fromJson(json.decode(str));

String usersDataToJson(UsersData data) => json.encode(data.toJson());

class UsersData {
  UsersData({
    required this.pk,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  int pk;
  String username;
  String email;
  String firstName;
  String lastName;

  factory UsersData.fromJson(Map<String, dynamic> json) => UsersData(
    pk: json["pk"],
    username: json["username"],
    email: json["email"],
    firstName: json["first_name"],
    lastName: json["last_name"],
  );

  Map<String, dynamic> toJson() => {
    "pk": pk,
    "username": username,
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
  };
}
