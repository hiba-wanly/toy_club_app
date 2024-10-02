import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:toy_club_app/constant.dart';
import 'package:toy_club_app/core/utils/api_service.dart';
import 'package:toy_club_app/core/utils/auth.dart';
import 'package:toy_club_app/core/utils/functions/save_login.dart';
import 'package:toy_club_app/features/login/data/models/login_model.dart';
import 'package:toy_club_app/features/signup/data/models/signup_model.dart';

abstract class LoginRemoteDataSource {
  Future<SignUp> fetchLoginData(Map<String, dynamic> data2);
  Future logoutUser();
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  final ApiService apiService;

  LoginRemoteDataSourceImpl(this.apiService);
  ApiLog apiLog = ApiLog();

  @override
  Future<SignUp> fetchLoginData(Map<String, dynamic> data2) async {
    debugPrint("okokokoko");
    var data = await apiLog.postLR(data1: data2, endPoint: 'api/user/login');
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    SignUp nums = getLogin(data);
    saveLoginData(nums, kLoginBox);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }

  @override
  Future logoutUser() async {
    debugPrint("okokokoko");
    var data = await apiService.get( endPoint: 'api/user/logout');
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    String nums = data['message'];
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }

  SignUp getLogin(Map<String, dynamic> data) {
    debugPrint("123456789");
    SignUp nums = SignUp.fromJson(data['data']);
    debugPrint("HRHRRTTTTTTTT");
    debugPrint(nums.toString());
    return nums;
  }
}
