import 'package:flutter/material.dart';
import 'package:toy_club_app/features/signup/data/models/signup_model.dart';

@immutable
abstract class SignupState{}

class SignupInitial extends SignupState{}

class SignupLoading extends SignupState{}

class SignupFailure extends SignupState{
  final String errMessage;
  SignupFailure(this.errMessage);
}

class SignupSuccess extends SignupState{
  final SignUp signup;
  SignupSuccess(this.signup);
}