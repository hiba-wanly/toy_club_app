import 'package:dartz/dartz.dart';
import 'package:toy_club_app/core/errors/failure.dart';
import 'package:toy_club_app/features/favorite/data/models/favorite_model.dart';

abstract class FavoriteRepo {
  Future<Either<ServerFailure, List<Favorite> >> fetchFavoriteData();
  Future<Either<ServerFailure, List<Favorite> >> addFavoriteData(Map<String,dynamic> data);
  Future<Either<ServerFailure, List<Favorite> >> deleteFavoriteData(int data);
}
