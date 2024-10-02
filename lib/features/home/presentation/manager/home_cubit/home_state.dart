import 'package:flutter/material.dart';
import 'package:toy_club_app/features/home/data/models/toy_type.dart';
import 'package:toy_club_app/features/home/data/models/toys_model.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeFailure extends HomeState {
  final String errMessage;
  HomeFailure(this.errMessage);
}

class HomeSuccess extends HomeState {
  final List<ToyType> toystype;
  HomeSuccess(this.toystype);
}
