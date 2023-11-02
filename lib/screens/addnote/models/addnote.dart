// To parse this JSON data, do
//
//     final addnote = addnoteFromJson(jsonString);

import 'dart:convert';

Addnote addnoteFromJson(String str) => Addnote.fromJson(json.decode(str));

String addnoteToJson(Addnote data) => json.encode(data.toJson());

class Addnote {
  String title;
  String description;
  int id;

  Addnote({
    required this.title,
    required this.description,
    required this.id,
  });

  factory Addnote.fromJson(Map<String, dynamic> json) => Addnote(
    title: json["title"],
    description: json["description"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "id": id,
  };
}
