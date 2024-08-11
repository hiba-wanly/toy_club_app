import 'package:flutter/material.dart';

class Toys {
  dynamic type_id;
  dynamic brand;
  dynamic sub_brand;
  dynamic set_number;
  dynamic theme;
  dynamic age;
  dynamic number_of_pieces;
  dynamic price;
  dynamic required_points;
  dynamic allow_able_renting_period;
  dynamic number_of_boxes;
  dynamic weight_of_boxes;
  dynamic description;

  Toys(
      {this.type_id,
      this.brand,
      this.sub_brand,
      this.set_number,
      this.theme,
      this.age,
      this.number_of_pieces,
      this.price,
      this.required_points,
      this.allow_able_renting_period,
      this.number_of_boxes,
      this.weight_of_boxes,
      this.description});



  Map<String, dynamic> toJson() {
    return {
      'type_id':type_id,
      'brand':brand,
      'sub_brand':sub_brand,
      'set_number':set_number,
      'theme':theme,
      'age':age,
      'number_of_pieces':number_of_pieces,
      'price':price,
      'required_points':required_points,
      'allow_able_renting_period':allow_able_renting_period,
      'number_of_boxes':number_of_boxes,
      'weight_of_boxes':weight_of_boxes,
      'description':description,
    };
  }




  Toys.fromJson(Map<String, dynamic> json) {
    debugPrint("11111112222222222222233333");
    type_id = json['type_id'];
    debugPrint(type_id.toString());
    brand = json['brand'];
    debugPrint(brand.toString());
    sub_brand = json['sub_brand'];
    debugPrint(sub_brand.toString());
    set_number = json['set_number'];
    debugPrint(set_number.toString());
    theme = json['theme'];
    debugPrint(theme.toString());
    age = json['age'];
    debugPrint(age.toString());
    number_of_pieces = json['number_of_pieces'];
    debugPrint(number_of_pieces.toString());
    price = json['price'];
    debugPrint(price.toString());
    required_points = json['required_points'];
    debugPrint(required_points.toString());
    allow_able_renting_period = json['allow_able_renting_period'];
    debugPrint(allow_able_renting_period.toString());
    number_of_boxes = json['number_of_boxes'];
    debugPrint(number_of_boxes.toString());
    weight_of_boxes = json['weight_of_boxes'];
    debugPrint(weight_of_boxes.toString());
    description = json['description'];
    debugPrint(description.toString());

  }
}
