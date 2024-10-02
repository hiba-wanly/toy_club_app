import 'package:flutter/material.dart';
import 'package:toy_club_app/features/favorite/data/models/favorite_model.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteFailure extends FavoriteState {
  final String errMessage;
  FavoriteFailure(this.errMessage);
}

class FavoriteSuccess extends FavoriteState {
  final List<Favorite> favorite;
  FavoriteSuccess(this.favorite);
}

class FavoriteSuccessString extends FavoriteState {
  final String mess;
  FavoriteSuccessString(this.mess);
}

// class FavoriteDLoading extends FavoriteState {}
//
// class FavoriteDFailure extends FavoriteState {
//   final String errMessage;
//   FavoriteDFailure(this.errMessage);
// }
//
// class FavoriteDSuccess extends FavoriteState {
//   final List<Favorite> favorite;
//   FavoriteDSuccess(this.favorite);
// }