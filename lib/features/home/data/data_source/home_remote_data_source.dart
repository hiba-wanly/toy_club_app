import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:toy_club_app/core/utils/api_service.dart';
import 'package:toy_club_app/features/home/data/models/toys_model.dart';

abstract class HomeRemoteDataSource {
  Future<Toys> fetchHomeData();

}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<Toys> fetchHomeData() async {
    var data = await apiService.get( endPoint:"" );
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    Toys nums = getToys(data);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }



  Toys getToys(Map<String, dynamic> data) {
    debugPrint("123456789");
    Toys nums = Toys.fromJson(data);
    debugPrint("HRHRRTTTTTTTT");
    debugPrint(nums.toString());
    return nums;
  }
}
