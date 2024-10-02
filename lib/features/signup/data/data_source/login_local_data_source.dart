import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:toy_club_app/constant.dart';
import 'package:toy_club_app/features/signup/data/models/signup_model.dart';

abstract class LoginLocalDataSource {
  SignUp fetchLogin();
}

class LoginLocalDataSourceImpl extends LoginLocalDataSource
{


  @override
  SignUp fetchLogin() {
    debugPrint("here fetchLogin");
    var box = Hive.box<SignUp>(kLoginBox);
    debugPrint(box.values.first.toString());
    debugPrint("here fetchLogin222");
    // box.clear();
    return box.values.first;
  }

}