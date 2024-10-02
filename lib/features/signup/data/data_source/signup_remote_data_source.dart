import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:toy_club_app/constant.dart';
import 'package:toy_club_app/core/utils/api_service.dart';
import 'package:toy_club_app/core/utils/auth.dart';
import 'package:toy_club_app/core/utils/functions/save_login.dart';
import 'package:toy_club_app/features/signup/data/models/signup_model.dart';

abstract class SignupRemoteDataSource {
  Future<SignUp> fetchSignupData(Map<String, dynamic> data2);
  Future logoutUser(dynamic id);
}

class SignupRemoteDataSourceImpl extends SignupRemoteDataSource {
  final ApiService apiService;
  SignupRemoteDataSourceImpl(this.apiService );

  ApiLog apiLog = ApiLog();
  @override
  Future<SignUp> fetchSignupData(Map<String, dynamic> data2) async {
    debugPrint("DDDDDDDDDDDDDDDDDDDd");
    var data = await apiLog.postLR(data1: data2, endPoint: 'api/user/register');
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    SignUp nums = getSignup(data);
    saveLoginData(nums, kLoginBox);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }

  @override
  Future logoutUser(dynamic id) async {}

  SignUp getSignup(Map<String, dynamic> data) {
    debugPrint("123456789");
    SignUp nums = SignUp.fromJson(data['data']);
    debugPrint("HRHRRTTTTTTTT");
    debugPrint(nums.toString());
    return nums;
  }
}
