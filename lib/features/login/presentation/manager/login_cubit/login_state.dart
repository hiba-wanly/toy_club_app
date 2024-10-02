import 'package:flutter/material.dart';
import 'package:toy_club_app/features/login/data/models/login_model.dart';
import 'package:toy_club_app/features/signup/data/models/signup_model.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginFailure extends LoginState {
  final String errMessage;
  LoginFailure(this.errMessage);
}

class LoginSuccess extends LoginState {
  final SignUp login;
  LoginSuccess(this.login);
}
class LoginSSuccess extends LoginState {
  final String login;
  LoginSSuccess(this.login);
}
