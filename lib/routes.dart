import 'package:flutter/material.dart';
import 'package:toy_club_app/constant.dart';
import 'package:toy_club_app/features/login/presentation/views/login_view.dart';
import 'package:toy_club_app/features/profile/presentation/views/language_view.dart';
import 'package:toy_club_app/features/signup/presentation/views/signup_view.dart';

Map<String,Widget Function(BuildContext)> routes = {
  AppRoute.login:(context) =>  LoginView(),
  AppRoute.signUp:(context) =>  SignUpView(),
  AppRoute.language:(context) => const LanguageView(),

};