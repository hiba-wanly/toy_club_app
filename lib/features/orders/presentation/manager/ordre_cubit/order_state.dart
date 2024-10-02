import 'package:flutter/material.dart';
import 'package:toy_club_app/features/orders/data/models/order_model.dart';

@immutable
abstract class OrderState {}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderFailure extends OrderState {
  final String errMessage;
  OrderFailure(this.errMessage);
}

class OrderSuccess extends OrderState {
  final List<OrderS> orderS;
  OrderSuccess(this.orderS);
}
