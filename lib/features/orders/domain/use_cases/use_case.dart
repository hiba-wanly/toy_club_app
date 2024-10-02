import 'package:dartz/dartz.dart';
import 'package:toy_club_app/core/errors/failure.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> callOrder(
      [Param param]);
  Future<Either<Failure, Type>> callAddOrder(Map<String, dynamic> data1,
  [Param param]);
}

class NoParam {}
