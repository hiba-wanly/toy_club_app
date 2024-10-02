import 'dart:io';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

// @HiveType(typeId: 0)
class Login {
  // @HiveField(0)
  dynamic id;
  // @HiveField(1)
  dynamic email;
  // @HiveField(2)
  dynamic password;

  Login({
    this.id,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
    };
  }

  Login.fromJson(Map<String, dynamic> json) {
    debugPrint("11111112222222222222233333");
    id = json['id'];
    debugPrint(id.toString());
    email = json['email'];
    debugPrint(email.toString());
  }
}
