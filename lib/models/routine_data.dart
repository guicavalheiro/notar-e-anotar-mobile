import 'package:flutter/material.dart';
import 'package:objectid/objectid.dart';

import 'additional_info.dart';
import 'mood.dart';

class RoutineData {
  String id;
  String routineId;
  String userId;
  List<Mood> moods = [];
  List<AdditionalInfo> additionalInfo = [];
  String dayDescription;

  RoutineData(
      {@required this.routineId,
      @required this.userId,
      @required this.moods,
      this.additionalInfo,
      this.dayDescription}) {
    this.id = ObjectId().toString();
  }

  @override
  String toString() {
    return 'RoutineData[id=$id, routineId=$routineId, userId=$userId, moods=$moods, additionalInfo=$additionalInfo, dayDescription=$dayDescription, ]';
  }

  RoutineData.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    routineId = json['routine_id'];
    userId = json['user_id'];
    moods = Mood.listFromJson(json['moods']);
    additionalInfo = AdditionalInfo.listFromJson(json['additionalInfo']);
    dayDescription = json['day_description'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'routine_id': routineId,
      'user_id': userId,
      'moods': moods,
      'additionalInfo': additionalInfo,
      'day_description': dayDescription
    };
  }

  static List<RoutineData> listFromJson(List<dynamic> json) {
    return json == null
        ? new List<RoutineData>()
        : json.map((value) => new RoutineData.fromJson(value)).toList();
  }

  static Map<String, RoutineData> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, RoutineData>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new RoutineData.fromJson(value));
    }
    return map;
  }
}
