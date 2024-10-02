import 'package:flutter/material.dart';
import 'package:toy_club_app/features/signup/data/models/signup_model.dart';

@immutable
abstract class ProfileState{}

class ProfileInitial extends ProfileState{}

class ProfileLoading extends ProfileState{}

class ProfileFailure extends ProfileState{
  final String errMessage;
  ProfileFailure(this.errMessage);
}

class ProfileSuccess extends ProfileState{
  final SignUp signup;
  ProfileSuccess(this.signup);
}


class ProfileSuccessLocal extends ProfileState{
  final String signup;
  ProfileSuccessLocal(this.signup);
}



