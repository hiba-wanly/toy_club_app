import 'package:dartz/dartz.dart';
import 'package:toy_club_app/core/errors/failure.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> callFavorite(
      [Param param]);
  Future<Either<Failure, Type>> callAddFavorite( Map<String, dynamic> data,
      [Param param]);
  Future<Either<Failure, Type>> callDeleteFavorite( int data,
      [Param param]);

}

class NoParam {}
