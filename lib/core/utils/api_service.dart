import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ApiService {
  final Dio _dio;
  final baseUrl = 'http://213.199.32.188:8888/';
  ApiService(this._dio);



  Future<Map<String, dynamic>> get({required String endPoint}) async {
    String? token =
    (await SharedPreferences.getInstance()).getString("access_token");
    var response = await _dio.get(
      '$baseUrl$endPoint',
      options: Options(headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + token!
      }),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> post({required String endPoint, required Map<String,dynamic> data1}) async {
    String? token =
    (await SharedPreferences.getInstance()).getString("access_token");
    // FormData data2 = FormData.fromMap(data1);
    debugPrint("M##11");
    debugPrint(data1.toString());
    // token = '12|M9fURnFeCdJqCy0oOs3g1tuYblg92jQZCJjxdCKFb689993a';
    var response = await _dio.post(
      '$baseUrl$endPoint',
      data: data1,
      options: Options(headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + token!
      }),
    );
    debugPrint("M##");
    debugPrint(response.toString());
    return response.data;
  }

  Future<Map<String, dynamic>> update({required String endPoint, required Map<String,dynamic> data}) async {
    String? token =
    (await SharedPreferences.getInstance()).getString("access_token");
    var response = await _dio.post(
      '$baseUrl$endPoint',
      data: data,
      options: Options(headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + token!
      }),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> delete({required String endPoint}) async {
    String? token =
    (await SharedPreferences.getInstance()).getString("access_token");
    // token = '10|AMWdJKkSe4OjZkbDh0ufq8r9iLTGbqj94kw2X6k95e551707';
    var response = await _dio.delete(
      '$baseUrl$endPoint',
      options: Options(headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + token!
      }),
    );
    return response.data;
  }


}

