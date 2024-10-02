import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toy_club_app/constant.dart';
import 'package:toy_club_app/core/utils/api_service.dart';
import 'package:toy_club_app/core/utils/auth.dart';
import 'package:toy_club_app/core/utils/functions/save_login.dart';
import 'package:toy_club_app/features/signup/data/models/signup_model.dart';

abstract class ProfileRemoteDataSource {
  Future<SignUp> fetchProfile(Map<String, dynamic> data2);

  Future<String> fetchDelete();
}

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  final ApiService apiService;
  ProfileRemoteDataSourceImpl(this.apiService );

  @override
  Future<SignUp> fetchProfile(Map<String, dynamic> data2) async {
    debugPrint("DDDDDDDDDDDDDDDDDDDd");
    var data = await apiService.post(data1: data2, endPoint: 'api/user/update');
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    SignUp nums = getSignup(data);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
    "firstName", nums.first_name);
    await prefs.setString(
    "lastName", nums.last_name);
    await prefs.setString(
    "email", nums.email);
    await prefs.setString(
    "address", nums.address);
    await prefs.setString(
    "telephone", nums.telephone);
    await prefs.setString(
    "telegramId", nums.telegram_id);

    saveLoginData(nums, kLoginBox);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }

  @override
  Future<String> fetchDelete() async {
    debugPrint("DDDDDDDDDDDDDDDDDDDd");
    var data = await apiService.delete(endPoint: 'api/user/delete');
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    String nums = data['message'];
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }



  SignUp getSignup(Map<String, dynamic> data) {
    debugPrint("123456789");
    SignUp nums = SignUp.fromJson(data['data']);
    debugPrint("HRHRRTTTTTTTT");
    debugPrint(nums.toString());
    return nums;
  }
}
