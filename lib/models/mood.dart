import 'package:flutter/material.dart';
import 'package:objectid/objectid.dart';

class Mood {
  String id;
  String name;

  Mood({@required this.name}) {
    this.id = ObjectId().toString();
  }

  @override
  String toString() {
    return 'Mood[id=$id, name=$name, ]';
  }

  Mood.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }

  static List<Mood> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => new Mood.fromJson(value)).toList();
  }

  static Map<String, Mood> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, Mood>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new Mood.fromJson(value));
    }
    return map;
  }
}
