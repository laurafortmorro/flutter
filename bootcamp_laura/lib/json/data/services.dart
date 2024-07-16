import 'dart:convert';
import 'package:bootcamp_laura/json/models/user.dart';
import 'package:flutter/services.dart';

Future<User> loadUserData() async {
  String jsonData = await rootBundle.loadString('assets/json/model.json');

  Map<String, dynamic> jsonMap =json.decode(jsonData);

  User user= User.fromJson(jsonMap);

  return user;
}