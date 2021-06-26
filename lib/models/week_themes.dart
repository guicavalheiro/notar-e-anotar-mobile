import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class WeekTheme {
  String title;
  bool isChecked;
  String id;

  static List<WeekTheme> themes = [];

  static Future<bool> fetchSubjects() async {
    List<WeekTheme> themeList = [];

    final response = await http.get(Uri.parse('http://54.144.31.34/api/subject/'));

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      for (var theme in json) {
        themeList.add(WeekTheme(theme['name'], false, theme['id']));
      }

      themes = themeList;
      return true;
    } else {
      return false;
    }
  }

  WeekTheme(String title, bool isChecked, String id) {
    this.title = title;
    this.isChecked = isChecked;
    this.id = id;
  }

  factory WeekTheme.fromJson(Map<String, dynamic> json) {
    dynamic themes = WeekTheme(json['name'], false, json['id']);
    return themes;
  }

  static List<WeekTheme> getThemes() {
    return themes;
  }

}
