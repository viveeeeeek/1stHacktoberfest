import 'dart:convert';

class Users {
  Users({
    required this.name,
    required this.description,
  });

  String name;
  String description;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
      };

  static List<Users> usersFromJson(String str) =>
      List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

  static String usersToJson(List<Users> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}
