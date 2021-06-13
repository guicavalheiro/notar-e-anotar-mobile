import 'package:flutter/material.dart';
import 'package:notar_e_anotar_app/models/subject.dart';
import 'package:objectid/objectid.dart';

class RoutinePlan {
  String id;
  int numberOfWeeks;
  List<Subject> subjects = [];

  RoutinePlan({@required this.numberOfWeeks, @required this.subjects}) {
    this.id = ObjectId().toString();
  }

  @override
  String toString() {
    return 'RoutinePlan[id=$id, numberOfWeeks=$numberOfWeeks, subjects=$subjects, ]';
  }

  RoutinePlan.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    numberOfWeeks = json['number_of_weeks'];
    subjects = Subject.listFromJson(json['subjects']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'number_of_weeks': numberOfWeeks, 'subjects': subjects};
  }

  static List<RoutinePlan> listFromJson(List<dynamic> json) {
    return json == null
        ? new List<RoutinePlan>()
        : json.map((value) => new RoutinePlan.fromJson(value)).toList();
  }

  static Map<String, RoutinePlan> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, RoutinePlan>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new RoutinePlan.fromJson(value));
    }
    return map;
  }
}
