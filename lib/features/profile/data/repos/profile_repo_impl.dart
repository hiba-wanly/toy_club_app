import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:toy_club_app/core/errors/failure.dart';
import 'package:toy_club_app/core/utils/auth.dart';
import 'package:toy_club_app/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:toy_club_app/features/profile/domain/repos/profile_repo.dart';
import 'package:toy_club_app/features/signup/data/data_source/login_local_data_source.dart';
import 'package:toy_club_app/features/signup/data/data_source/signup_remote_data_source.dart';
import 'package:toy_club_app/features/signup/data/models/signup_model.dart';
import 'package:toy_club_app/features/signup/domain/repos/signup_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ProfileRemoteDataSource profileRemoteDataSource;

  ProfileRepoImpl({
    required this.profileRemoteDataSource
  });


  @override
  Future<Either<ServerFailure, SignUp>> fetchProfile(Map<String, dynamic> data2) async {
    try {
      SignUp nums;
      nums = await profileRemoteDataSource.fetchProfile(data2);

      debugPrint("KKKHEREERER2222222200");
      debugPrint(nums.toString());
      debugPrint("KKKHEREERER2222222200");
      return right(nums);
    }   catch (e) {
      debugPrint("KKKHEREERER2222222200erorororor");
      debugPrint(e.toString());
      if(e is DioError){
        debugPrint("nonono");
        return left(ServerFailure("cannot fetch profile "));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, String>> fetchDelete() async {
    try {
      String nums;
      nums = await profileRemoteDataSource.fetchDelete();

      debugPrint("KKKHEREERER2222222200");
      debugPrint(nums.toString());
      debugPrint("KKKHEREERER2222222200");
      return right(nums);
    }   catch (e) {
      debugPrint("KKKHEREERER2222222200erorororor");
      debugPrint(e.toString());
      if(e is DioError){
        debugPrint("nonono");
        return left(ServerFailure("cannot fetch profile "));
      }
      return left(ServerFailure(e.toString()));
    }
  }



}
