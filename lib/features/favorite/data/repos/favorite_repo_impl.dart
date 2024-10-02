import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:toy_club_app/core/errors/failure.dart';
import 'package:toy_club_app/features/favorite/data/data_source/favorite_remote_data_source.dart';
import 'package:toy_club_app/features/favorite/data/models/favorite_model.dart';
import 'package:toy_club_app/features/favorite/domain/repos/favorite_repo.dart';


class FavoriteRepoImpl extends FavoriteRepo {
  final FavoriteRemoteDataSource favoriteRemoteDataSource;

  FavoriteRepoImpl({
    required this.favoriteRemoteDataSource,
  });

  @override
  Future<Either<ServerFailure, List<Favorite>>> fetchFavoriteData(
      ) async {
    try {
      debugPrint("KKKHEREERER");
      List<Favorite> nums;
      nums = (await favoriteRemoteDataSource.fetchFavoriteData()) ;
      debugPrint("AAAAAAAA");
      debugPrint(nums.toString());
      return right(nums);
    } catch (e) {
      if (e is DioError) {
        debugPrint("ERORRORORO11111111111");
        debugPrint(e.toString());
        return left(ServerFailure("cannot fetch orders "));
      }
      debugPrint("ERORROROR22222222222");
      debugPrint(e.toString());
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, List<Favorite>>> addFavoriteData(Map<String, dynamic> data)
    async {
      try {
        debugPrint("KKKHEREERER");
        List<Favorite> nums;
        nums = (await favoriteRemoteDataSource.addFavoriteData(data)) ;
    debugPrint("AAAAAAAA");
    debugPrint(nums.toString());
    return right(nums);
    } catch (e) {
    if (e is DioError) {
    debugPrint("ERORRORORO11111111111");
    debugPrint(e.toString());
    return left(ServerFailure("cannot fetch orders "));
    }
    debugPrint("ERORROROR22222222222");
    debugPrint(e.toString());
    return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, List<Favorite>>> deleteFavoriteData(int data)
  async {
    try {
      debugPrint("KKKHEREERER");
      List<Favorite> nums;
      nums = (await favoriteRemoteDataSource.deleteFavoriteData(data)) ;
      debugPrint("AAAAAAAA");
      debugPrint(nums.toString());
      return right(nums);
    } catch (e) {
      if (e is DioError) {
        debugPrint("ERORRORORO11111111111");
        debugPrint(e.toString());
        return left(ServerFailure("cannot fetch orders "));
      }
      debugPrint("ERORROROR22222222222");
      debugPrint(e.toString());
      return left(ServerFailure(e.toString()));
    }
  }

  }




