// To parse this JSON data, do
//
//     final listofnote = listofnoteFromJson(jsonString);

import 'dart:convert';

Listofnote listofnoteFromJson(String str) => Listofnote.fromJson(json.decode(str));

String listofnoteToJson(Listofnote data) => json.encode(data.toJson());

class Listofnote {
  bool error;
  List<Datum> data;

  Listofnote({
    required this.error,
    required this.data,
  });

  factory Listofnote.fromJson(Map<String, dynamic> json) => Listofnote(
    error: json["error"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))).reversed.toList(),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  int userId;
  String title;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  int isDeleted;

  Datum({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.isDeleted,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["user_id"],
    title: json["title"],
    description: json["description"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    isDeleted: json["is_deleted"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "title": title,
    "description": description,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "is_deleted": isDeleted,
  };
}
