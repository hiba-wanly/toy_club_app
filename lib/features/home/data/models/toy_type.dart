import 'package:flutter/material.dart';
import 'package:toy_club_app/features/home/data/models/toys_model.dart';

class ToyType{
  dynamic id ;
  dynamic name;
 late List<Toys> toy;
  ToyType({
    this.name,
    required this.toy});
  Map<String, dynamic> toJson() {
    return {
      'name':name,
    };
  }
  ToyType.fromJson(Map<String, dynamic> json) {
    debugPrint("11111112222222222222233333");
    id = json['id'];
    name = json['name'];
    toy = (json['toy'] as List).map((e) => Toys.fromJson(e)).toList();
    debugPrint(name.toString());
  }
}