import 'package:flutter/material.dart';
import 'package:toy_club_app/features/home/data/models/toys_model.dart';

class Favorite {

  dynamic id;
  dynamic toy_id;
  dynamic user_id;
  late Toys toy;

  Favorite({
this.id,
    this.toy_id,
    this.user_id,
    required this.toy
  });
  // Map<String, dynamic> toJson() {
  //   return {
  //     'available_toy_id': available_toy_id,
  //     'user_id': user_id,
  //     'number_of_days': number_of_days,
  //     'status': status,
  //     'toy_id': toy_id,
  //     'admin_id': admin_id,
  //     'delivery_date': delivery_date,
  //     'due_date': due_date,
  //     'return_date': return_date,
  //   };
  // }
  Favorite.fromJson(Map<String, dynamic> json) {
    debugPrint("11111112222222222222233333");
    id = json['id'];
    user_id = json['userId'];
    toy_id = json['toyId'];
    toy = Toys.fromJson(json['toy']);
  }
}
