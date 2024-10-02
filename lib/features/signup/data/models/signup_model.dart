import 'dart:io';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
part  'signup_model.g.dart';

@HiveType(typeId: 1)
class SignUp {
  @HiveField(0)
  dynamic id;
  @HiveField(1)
  dynamic email;
  @HiveField(2)
  dynamic password;
  @HiveField(3)
  dynamic user_name;
  @HiveField(4)
  dynamic first_name;
  @HiveField(5)
  dynamic last_name;
  @HiveField(6)
  dynamic type;
  @HiveField(7)
  dynamic address;
  @HiveField(8)
  dynamic telephone;
  @HiveField(9)
  dynamic telegram_id;
  @HiveField(10)
  dynamic points;
  @HiveField(11)
  dynamic reservation_allowed;
  @HiveField(12)
  dynamic accessToken;

  SignUp({
    this.id,
     this.email,
    this.password,
     this.user_name,
     this.first_name,
     this.last_name,
     this.type,
     this.address,
     this.telephone,
     this.telegram_id,
     this.points,
     this.reservation_allowed,
    this.accessToken,
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
    id = json['id'];
    // debugPrint(id.toString());

    email = json['email'];
    debugPrint(email.toString());

    user_name = json['userName'];
    debugPrint(user_name.toString());
    first_name = json['firstName'];
    debugPrint(first_name.toString());
    last_name = json['lastName'];
    debugPrint(last_name.toString());
    address = json['address'];
    debugPrint(address.toString());
    telephone = json['telephone'];
    debugPrint(telephone.toString());
    telegram_id = json['telegramId'];
    debugPrint(telegram_id.toString());
    type = json['type'];
    debugPrint(type.toString());
    reservation_allowed = json['reservationAllowed'];
    debugPrint(reservation_allowed.toString());
    points = json['points'];
    debugPrint(points.toString());
    password = json['password'];
    accessToken = json['accessToken'];
  }
}
