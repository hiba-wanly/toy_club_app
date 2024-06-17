import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:toy_club_app/core/errors/failure.dart';
import 'package:toy_club_app/features/signup/data/data_source/signup_remote_data_source.dart';
import 'package:toy_club_app/features/signup/data/models/signup_model.dart';
import 'package:toy_club_app/features/signup/domain/repos/signup_repo.dart';

class SignupRepoImpl extends SignupRepo {
  final SignupRemoteDataSource signupRemoteDataSource;

  SignupRepoImpl({
    required this.signupRemoteDataSource,
  });

  @override
  Future<Either<ServerFailure, SignUp>> fetchSignupData(
      Map<String, dynamic> data2) async {
    try {
      debugPrint("KKKHEREERER");
      SignUp nums;
      nums = await signupRemoteDataSource.fetchSignupData(data2);
      debugPrint("AAAAAAAA");
      debugPrint(nums.toString());
      return right(nums);
    } catch (e) {
      if (e is DioError) {
        debugPrint("ERORRORORO11111111111");
        return left(ServerFailure("cannot login "));
      }
      debugPrint("ERORROROR22222222222");
      debugPrint(e.toString());
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, SignUp>> logoutUser(dynamic id) async {
    try {
      debugPrint("ADDMATERIALLLLLLL");
      SignUp nums;
      nums = await signupRemoteDataSource.logoutUser(id);
      return right(nums);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
