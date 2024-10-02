import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:toy_club_app/features/login/data/models/login_model.dart';
import 'package:toy_club_app/features/signup/data/models/signup_model.dart';

void saveLoginData(SignUp login, String boxName){
  var box = Hive.box(boxName); //<SignUp>
  box.clear();
  box.add(login);
  debugPrint("here save login");
  debugPrint(box.values.first.toString());
  debugPrint("here save login");
}
void deleteLoginData( String boxName){
  var box = Hive.box<SignUp>(boxName);
  box.clear();
  debugPrint(box.toString());
}
