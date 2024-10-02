import 'package:flutter/material.dart';
import 'package:toy_club_app/features/favorite/data/models/favorite_model.dart';

@immutable
abstract class FavoriteDState {}

class FavoriteDInitial extends FavoriteDState {}

class FavoriteDLoading extends FavoriteDState {}

class FavoriteDFailure extends FavoriteDState {
  final String errMessage;
  FavoriteDFailure(this.errMessage);
}

class FavoriteDSuccess extends FavoriteDState {
  final List<Favorite> favorite;
  FavoriteDSuccess(this.favorite);
}