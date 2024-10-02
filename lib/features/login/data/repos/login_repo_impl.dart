import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:toy_club_app/core/errors/failure.dart';
import 'package:toy_club_app/features/login/data/data_source/login_remote_data_source.dart';
import 'package:toy_club_app/features/login/data/models/login_model.dart';
import 'package:toy_club_app/features/login/domain/repos/login_repo.dart';
import 'package:toy_club_app/features/signup/data/models/signup_model.dart';

class LoginRepoImpl extends LoginRepo {
  final LoginRemoteDataSource loginRemoteDataSource;

  LoginRepoImpl({
    required this.loginRemoteDataSource,
  });

  @override
  Future<Either<ServerFailure, SignUp>> fetchLoginData(
      Map<String, dynamic> data2) async {
    try {
      debugPrint("KKKHEREERER");
      SignUp nums;
      nums = await loginRemoteDataSource.fetchLoginData(data2);
      debugPrint("AAAAAAAA");
      debugPrint(nums.toString());
      return right(nums);
    } catch (e) {
      if (e is DioError) {
        debugPrint("ERORRORORO11111111111");
        debugPrint(e.toString());
        return left(ServerFailure("cannot login "));
      }
      debugPrint("ERORROROR22222222222");
      debugPrint(e.toString());
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, String>> logoutUser() async {
    try {
      debugPrint("ADDMATERIALLLLLLL");
      String nums;
      nums = await loginRemoteDataSource.logoutUser();
      return right(nums);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
