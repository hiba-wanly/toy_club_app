import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:toy_club_app/core/errors/failure.dart';
import 'package:toy_club_app/features/home/data/data_source/home_remote_data_source.dart';
import 'package:toy_club_app/features/home/data/models/toy_type.dart';
import 'package:toy_club_app/features/home/data/models/toys_model.dart';
import 'package:toy_club_app/features/home/domain/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl({
    required this.homeRemoteDataSource,
  });

  @override
  Future<Either<ServerFailure, List<ToyType>>> fetchHomeData() async {
    try {
      debugPrint("KKKHEREERER");
      List<ToyType> nums;
      nums = await homeRemoteDataSource.fetchHomeData();
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


}
