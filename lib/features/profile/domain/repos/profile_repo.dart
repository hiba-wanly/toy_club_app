import 'package:dartz/dartz.dart';
import 'package:toy_club_app/core/errors/failure.dart';
import 'package:toy_club_app/features/signup/data/models/signup_model.dart';

abstract class ProfileRepo {
  Future<Either<ServerFailure, SignUp>> fetchProfile(
      Map<String, dynamic> data2);

  Future<Either<ServerFailure, String>> fetchDelete();

}
