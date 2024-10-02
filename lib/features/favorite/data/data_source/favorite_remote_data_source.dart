import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:toy_club_app/core/utils/api_service.dart';
import 'package:toy_club_app/features/favorite/data/models/favorite_model.dart';
import 'package:toy_club_app/features/orders/data/models/order_model.dart';

abstract class FavoriteRemoteDataSource {
  Future<List<Favorite>> fetchFavoriteData();
  Future<List<Favorite>> addFavoriteData(Map<String, dynamic> data);
  Future<List<Favorite>> deleteFavoriteData(int data);
}

class FavoriteRemoteDataSourceImpl extends FavoriteRemoteDataSource {
  final ApiService apiService;
  FavoriteRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<Favorite>> fetchFavoriteData() async {
    var data = await apiService.get( endPoint: 'api/favorite-toy/get-by-user-id',);
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    List<Favorite> nums = getFavorite(data);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }
  @override
  Future<List<Favorite>> addFavoriteData(Map<String, dynamic> data2)  async {
    var data = await apiService.post( endPoint: 'api/favorite-toy/add', data1: data2,);
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    List<Favorite> nums = getFavorite(data);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }
  @override
  Future<List<Favorite>> deleteFavoriteData(int data2)  async {
    var data = await apiService.delete( endPoint: 'api/favorite-toy/remove-by-id/${data2}',);
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    List<Favorite> nums = getFavorite(data);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }



  List<Favorite> getFavorite(Map<String, dynamic> data) {
    debugPrint("123456789");
    // List<OrderS> nums = OrderS.fromJson(data);
    List<Favorite> nums=[];
    for(var numMap in data['data']){
      nums.add(Favorite.fromJson(numMap));
    }
    debugPrint("HRHRRTTTTTTTT");
    debugPrint(nums.toString());
    return nums;
  }


}
