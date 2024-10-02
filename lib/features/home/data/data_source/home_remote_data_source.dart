import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:toy_club_app/core/utils/api_service.dart';
import 'package:toy_club_app/features/home/data/models/toy_type.dart';
import 'package:toy_club_app/features/home/data/models/toys_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<ToyType>> fetchHomeData();

}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<ToyType>> fetchHomeData() async {
    var data = await apiService.get( endPoint:"api/toy/type/get-all" );
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    List<ToyType> nums = getToyType(data);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }



  List<ToyType> getToyType(Map<String, dynamic> data) {
    debugPrint("123456789");
    // Toys nums = Toys.fromJson(data);.
    List<ToyType> nums=[];
    for(var numMap in data['data']){
    nums.add(ToyType.fromJson(numMap));
    }
    debugPrint("HRHRRTTTTTTTT");
    debugPrint(nums.toString());
    return nums;
  }

}
