import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiLog {

  // final Dio _dio;
  final baseUrl = 'http://213.199.32.188:8888/';
  // ApiLog(this._dio);
  Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://213.199.32.188:8888/',
      connectTimeout: const Duration(seconds: 50),
      receiveTimeout: const Duration(seconds: 50),
    ),
  );

  userId(String id) async {
    (await SharedPreferences.getInstance()).setString("id", id);
  }

  Future getUserId() async {
    return (await SharedPreferences.getInstance()).get("id");
  }

  Future getUser() async {
    return await getUserId();
  }

  void idy() async {
    int idnum = await getUserId();
    print(idnum);
  }




  Future getToken() async {
    return (await SharedPreferences.getInstance()).get("token");
  }

  storeDataProfile(String data) async {
    (await SharedPreferences.getInstance()).setString(
        "data_profile", data);
  }


  Future getDataProfile() async {
    return (await SharedPreferences.getInstance()).get("data_profile");
  }


  storeToken(String access_token) async {
    (await SharedPreferences.getInstance()).setString(
        "access_token", access_token);
  }
  storeId(String id) async {
    (await SharedPreferences.getInstance()).setString(
        "id", id);
  }
  storeuserName(String userName) async {
    (await SharedPreferences.getInstance()).setString(
        "userName", userName);
  }
  storefirstName(String firstName) async {
    (await SharedPreferences.getInstance()).setString(
        "firstName", firstName);
  }
  storelastName(String lastName) async {
    (await SharedPreferences.getInstance()).setString(
        "lastName", lastName);
  }
  storetype(String type) async {
    (await SharedPreferences.getInstance()).setString(
        "type", type);
  }
  storeemail(String email) async {
    (await SharedPreferences.getInstance()).setString(
        "email", email);
  }
  storeaddress(String address) async {
    (await SharedPreferences.getInstance()).setString(
        "address", address);
  }
  storetelephone(String telephone) async {
    (await SharedPreferences.getInstance()).setString(
        "telephone", telephone);
  }

  storetelegramId(String telegramId) async {
    (await SharedPreferences.getInstance()).setString(
        "telegramId", telegramId);
  }
  Future<Map<String, dynamic>> postLR({required String endPoint, required Map<String,dynamic> data1}) async {
    FormData data2 = FormData.fromMap(data1);
    debugPrint("M##11");
    debugPrint(data1.toString());
    var response = await _dio.post(
      '$baseUrl$endPoint',
      data: data2,
      options: Options(headers: {
        'Accept': 'application/json',
      }),
    );
    debugPrint("M##");
    debugPrint(response.toString());
    if(response.statusCode == 200){
      storeToken(response.data['data']['accessToken']);
      storeId(response.data['data']['id'].toString());
      storeuserName(response.data['data']['userName']);
      storefirstName(response.data['data']['firstName']);
      storelastName(response.data['data']['lastName']);
      storetype(response.data['data']['type']);
      storeemail(response.data['data']['email']);
      storeaddress(response.data['data']['address']);
      storetelephone(response.data['data']['telephone']);
      storetelegramId(response.data['data']['telegramId']);
      storeDataProfile(jsonEncode(response.data['data']));
      userId(response.data['data']['id'].toString());
    }
    return response.data;
  }



}