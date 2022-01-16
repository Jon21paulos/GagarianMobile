
import 'dart:convert';

TokenData tokenDataFromJson(String str) => TokenData.fromJson(json.decode(str));

String tokenDataToJson(TokenData data) => json.encode(data.toJson());

class TokenData {
  TokenData({
    required this.key,
  });

  String key;

  factory TokenData.fromJson(Map<String, dynamic> json) => TokenData(
    key: json["key"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
  };
}
