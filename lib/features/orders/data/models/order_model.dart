import 'package:flutter/material.dart';

class OrderS {
  dynamic available_toy_id;
  dynamic user_id;
  dynamic number_of_days;
  dynamic status;
  dynamic toy_id;
  dynamic admin_id;
  dynamic delivery_date;
  dynamic due_date;
  dynamic return_date;
  OrderS({
    this.available_toy_id,
    this.toy_id,
    this.user_id,
    this.number_of_days,
    this.delivery_date,
    this.return_date,
    this.status,
  });
  Map<String, dynamic> toJson() {
    return {
      'available_toy_id': available_toy_id,
      'user_id': user_id,
      'number_of_days': number_of_days,
      'status': status,
      'toy_id': toy_id,
      'admin_id': admin_id,
      'delivery_date': delivery_date,
      'due_date': due_date,
      'return_date': return_date,
    };
  }
  OrderS.fromJson(Map<String, dynamic> json) {
    debugPrint("11111112222222222222233333");
    available_toy_id = json['available_toy_id'];
    debugPrint(available_toy_id.toString());
    user_id = json['user_id'];
    debugPrint(user_id.toString());
    number_of_days = json['number_of_days'];
    debugPrint(number_of_days.toString());
    status = json['status'];
    debugPrint(status.toString());
    toy_id = json['toy_id'];
    debugPrint(toy_id.toString());
    admin_id = json['admin_id'];
    debugPrint(admin_id.toString());
    delivery_date = json['delivery_date'];
    debugPrint(delivery_date.toString());
    due_date = json['due_date'];
    debugPrint(due_date.toString());
    return_date = json['return_date'];
    debugPrint(return_date.toString());
  }
}
