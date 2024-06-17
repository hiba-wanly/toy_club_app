import 'package:dartz/dartz.dart';
import 'package:toy_club_app/core/errors/failure.dart';
import 'package:toy_club_app/features/login/data/models/login_model.dart';

abstract class LoginRepo {
  Future<Either<ServerFailure, Login>> fetchLoginData(
      Map<String, dynamic> data2);
  Future<Either<ServerFailure, Login>> logoutUser(dynamic id);
}
