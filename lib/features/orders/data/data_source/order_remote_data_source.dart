import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:toy_club_app/core/utils/api_service.dart';
import 'package:toy_club_app/features/orders/data/models/order_model.dart';

abstract class OrderRemoteDataSource {
  Future<List<OrderS>> fetchOrderData();
  Future<List<OrderS>> addOrderData(Map<String , dynamic> data1);
}

class OrderRemoteDataSourceImpl extends OrderRemoteDataSource {
  final ApiService apiService;
  OrderRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<OrderS>> fetchOrderData() async {
    var data = await apiService.get( endPoint: 'api/order/get-by-user-id',);
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    List<OrderS> nums = getOrder(data);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }



  List<OrderS> getOrder(Map<String, dynamic> data) {
    debugPrint("123456789");
    // List<OrderS> nums = OrderS.fromJson(data);
    List<OrderS> nums=[];
    for(var numMap in data['data']){
      nums.add(OrderS.fromJson(numMap));
    }
    debugPrint("HRHRRTTTTTTTT");
    debugPrint(nums.toString());
    return nums;
  }

  @override
  Future<List<OrderS>> addOrderData(Map<String, dynamic> data1) async {
    var data = await apiService.post( endPoint: 'api/order/add', data1: data1,);
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    List<OrderS> nums = getOrder(data);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }
}
