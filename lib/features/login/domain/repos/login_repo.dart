import 'package:dartz/dartz.dart';
import 'package:toy_club_app/core/errors/failure.dart';
import 'package:toy_club_app/features/login/data/models/login_model.dart';
import 'package:toy_club_app/features/signup/data/models/signup_model.dart';

abstract class LoginRepo {
  Future<Either<ServerFailure, SignUp>> fetchLoginData(
      Map<String, dynamic> data2);
  Future<Either<ServerFailure, String>> logoutUser();
}
