import 'package:flutter/material.dart';

class ToyType{
  dynamic name;
  ToyType({this.name,});
  Map<String, dynamic> toJson() {
    return {
      'name':name,
    };
  }
  ToyType.fromJson(Map<String, dynamic> json) {
    debugPrint("11111112222222222222233333");
    name = json['name'];
    debugPrint(name.toString());
  }
}