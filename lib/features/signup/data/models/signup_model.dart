import 'dart:io';

import 'package:flutter/material.dart';

class SignUp {
  // dynamic id;
  dynamic email;
  dynamic password;
  dynamic user_name;
  dynamic first_name;
  dynamic last_name;
  dynamic type;
  dynamic address;
  dynamic telephone;
  dynamic telegram_id;
  dynamic points;
  dynamic reservation_allowed;

  SignUp({
    // required this.id,
    required this.email,
    required this.password,
    required this.user_name,
    required this.first_name,
    required this.last_name,
    required this.type,
    required this.address,
    required this.telephone,
    required this.telegram_id,
    required this.points,
    required this.reservation_allowed,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "user_name": user_name,
      'first_name':first_name,
      'last_name':last_name,
      'type':type,
      'address':address,
      'telephone':telephone,
      'telegram_id':telegram_id,
      'points':points,
      'reservation_allowed':reservation_allowed,
    };
  }

  SignUp.fromJson(Map<String, dynamic> json) {
    debugPrint("11111112222222222222233333");
    // id = json['id'];
    // debugPrint(id.toString());

    email = json['email'];
    debugPrint(email.toString());

    user_name = json['user_name'];
    debugPrint(user_name.toString());

    first_name = json['first_name'];
    debugPrint(first_name.toString());
    last_name = json['last_name'];
    debugPrint(last_name.toString());
    address = json['address'];
    debugPrint(address.toString());
    telephone = json['telephone'];
    debugPrint(telephone.toString());
    telegram_id = json['telegram_id'];
    debugPrint(telegram_id.toString());
    type = json['type'];
    debugPrint(type.toString());
    reservation_allowed = json['reservation_allowed'];
    debugPrint(reservation_allowed.toString());
    points = json['points'];
    debugPrint(points.toString());

    password = json['password'];
  }
}
