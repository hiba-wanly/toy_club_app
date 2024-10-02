import 'package:dartz/dartz.dart';
import 'package:toy_club_app/core/errors/failure.dart';
import 'package:toy_club_app/features/signup/data/models/signup_model.dart';

abstract class SignupRepo {
  Future<Either<ServerFailure, SignUp>> fetchSignupData(
      Map<String, dynamic> data2);
  Future<Either<ServerFailure, SignUp>> logoutUser(dynamic id);
  Future<Either<ServerFailure,String>> fetchLogin();

}
