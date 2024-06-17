import 'package:dartz/dartz.dart';
import 'package:toy_club_app/core/errors/failure.dart';
import 'package:toy_club_app/features/home/data/models/toys_model.dart';

abstract class HomeRepo {
  Future<Either<ServerFailure, Toys>> fetchHomeData();
}
