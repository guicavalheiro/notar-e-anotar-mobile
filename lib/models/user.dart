import 'package:flutter/material.dart';
import 'package:objectid/objectid.dart';

class User {
  String id;
  String firstName;
  String lastName;
  String email;
  String password;
  String sessionToken;

  User(
      {@required this.firstName,
      @required this.lastName,
      @required this.email,
      @required this.password,
      @required this.sessionToken}) {
    this.id = ObjectId().toString();
  }

  @override
  String toString() {
    return 'User[id=$id, firstName=$firstName, lastName=$lastName, email=$email, password=$password, sessionToken=$sessionToken, ]';
  }

  User.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    password = json['password'];
    sessionToken = json['session_token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
      'session_token': sessionToken
    };
  }

  static List<User> listFromJson(List<dynamic> json) {
    return json == null
        ? new List<User>()
        : json.map((value) => new User.fromJson(value)).toList();
  }

  static Map<String, User> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, User>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new User.fromJson(value));
    }
    return map;
  }
}
