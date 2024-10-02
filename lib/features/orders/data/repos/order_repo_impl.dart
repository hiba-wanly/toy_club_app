import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:toy_club_app/core/errors/failure.dart';
import 'package:toy_club_app/features/orders/data/data_source/order_remote_data_source.dart';
import 'package:toy_club_app/features/orders/data/models/order_model.dart';
import 'package:toy_club_app/features/orders/domain/repos/order_repo.dart';

class OrderRepoImpl extends OrderRepo {
  final OrderRemoteDataSource orderRemoteDataSource;

  OrderRepoImpl({
    required this.orderRemoteDataSource,
  });

  @override
  Future<Either<ServerFailure, List<OrderS>>> fetchOrderData(
      ) async {
    try {
      debugPrint("KKKHEREERER");
      List<OrderS> nums;
      nums = (await orderRemoteDataSource.fetchOrderData()) ;
      debugPrint("AAAAAAAA");
      debugPrint(nums.toString());
      return right(nums);
    } catch (e) {
      if (e is DioError) {
        debugPrint("ERORRORORO11111111111");
        debugPrint(e.toString());
        return left(ServerFailure(e.toString()));
      }
      debugPrint("ERORROROR22222222222");
      debugPrint(e.toString());
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, List<OrderS>>> addOrderData(Map<String, dynamic> data1) async {
    try {
      debugPrint("KKKHEREERER");
      List<OrderS> nums;
      nums = (await orderRemoteDataSource.addOrderData(data1)) ;
      debugPrint("AAAAAAAA");
      debugPrint(nums.toString());
      return right(nums);
    } catch (e) {
      if (e is DioError) {
        debugPrint("ERORRORORO11111111111");
        debugPrint(e.toString());
        return left(ServerFailure(e.toString()));
      }
      debugPrint("ERORROROR22222222222");
      debugPrint(e.toString());
      return left(ServerFailure(e.toString()));
    }
  }




}
