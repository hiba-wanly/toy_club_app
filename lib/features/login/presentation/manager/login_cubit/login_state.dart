import 'package:flutter/material.dart';
import 'package:toy_club_app/features/login/data/models/login_model.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginFailure extends LoginState {
  final String errMessage;
  LoginFailure(this.errMessage);
}

class LoginSuccess extends LoginState {
  final Login login;
  LoginSuccess(this.login);
}
