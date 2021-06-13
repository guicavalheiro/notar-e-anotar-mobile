import 'package:flutter/material.dart';
import 'package:objectid/objectid.dart';

class Subject {
  String id;
  String name;

  Subject({@required this.name}) {
    this.id = ObjectId().toString();
  }

  @override
  String toString() {
    return 'Subject[id=$id, name=$name, ]';
  }

  Subject.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }

  static List<Subject> listFromJson(List<dynamic> json) {
    return json == null
        ? new List<Subject>()
        : json.map((value) => new Subject.fromJson(value)).toList();
  }

  static Map<String, Subject> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, Subject>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new Subject.fromJson(value));
    }
    return map;
  }
}
