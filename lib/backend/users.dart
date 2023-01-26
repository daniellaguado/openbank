// To parse this JSON data, do
//
//     final userInformation = userInformationFromMap(jsonString);

import 'dart:convert';

class UserInformation {
  UserInformation({
    required this.user1,
    required this.user2,
  });

  User user1;
  User user2;

  factory UserInformation.fromJson(String str) =>
      UserInformation.fromMap(json.decode(str));

  set id(String id) {}

  String toJson() => json.encode(toMap());

  factory UserInformation.fromMap(Map<String, dynamic> json) => UserInformation(
        user1: User.fromMap(json["user1"]),
        user2: User.fromMap(json["user2"]),
      );

  Map<String, dynamic> toMap() => {
        "user1": user1.toMap(),
        "user2": user2.toMap(),
      };
}

class User {
  User({
    required this.activo,
    required this.cpf,
    required this.name,
    required this.picture,
    required this.reais,
  });

  bool activo;
  int cpf;
  String name;
  String picture;
  int reais;
  // String? id;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        activo: json["activo"],
        cpf: json["cpf"],
        name: json["name"],
        picture: json["picture"],
        reais: json["reais"],
      );

  Map<String, dynamic> toMap() => {
        "activo": activo,
        "cpf": cpf,
        "name": name,
        "picture": picture,
        "reais": reais,
      };
}
