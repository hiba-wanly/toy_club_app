import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:toy_club_app/core/utils/api_service.dart';
import 'package:toy_club_app/features/orders/data/models/order_model.dart';

abstract class OrderRemoteDataSource {
  Future<OrderS> fetchOrderData(Map<String, dynamic> data2);
}

class OrderRemoteDataSourceImpl extends OrderRemoteDataSource {
  final ApiService apiService;
  OrderRemoteDataSourceImpl(this.apiService);

  @override
  Future<OrderS> fetchOrderData(Map<String, dynamic> data2) async {
    var data = await apiService.post(data1: data2, endPoint: '');
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    OrderS nums = getOrder(data);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }



  OrderS getOrder(Map<String, dynamic> data) {
    debugPrint("123456789");
    OrderS nums = OrderS.fromJson(data);
    debugPrint("HRHRRTTTTTTTT");
    debugPrint(nums.toString());
    return nums;
  }
}
