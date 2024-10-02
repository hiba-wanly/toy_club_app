import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toy_club_app/features/profile/domain/use_cases/fetch_profile_use_case.dart';
import 'package:toy_club_app/features/profile/presentation/manager/profile_cubit/profile_state.dart';
import 'package:toy_club_app/features/signup/data/models/signup_model.dart';
import 'package:toy_club_app/features/signup/domain/use_cases/fetch_signup_use_case.dart';


class ProfileCubit extends Cubit<ProfileState> {



  ProfileCubit(this.fetchProfileUseCase , this.fetchProfileSUseCase,
      {required this.isLoggedIn,
        required this.id,
        required this.userName,
        required this.firstName,
        required this.lastName,
        required this.type,
        required this.email,
        required this.address,
        required this.telephone,
        required this.telegramId}) : super(ProfileInitial());

  final FetchProfileUseCase fetchProfileUseCase;
  final FetchProfileSUseCase fetchProfileSUseCase;

  late bool isLoggedIn;
  late String  id;
  late String userName;
  late String firstName;
  late String lastName;
  late String type;
  late String email;
  late String address;
  late String telephone;
  late String telegramId;

  Future<void> fetchProfile(Map<String, dynamic> data1) async{
    emit(ProfileLoading());
    // Map<String, dynamic> data1 = data.toJson();
    var result = await  fetchProfileUseCase.call(data1);

    result.fold((failure) {
      emit(ProfileFailure(failure.message));
    }, (login) {
      this.isLoggedIn = true;
      saveInfo();
      emit(ProfileSuccess(login));
    });
  }

  Future<void> deleteAccount() async{
    emit(ProfileLoading());

    var result = await  fetchProfileSUseCase.calldelete();

    result.fold((failure) {

      emit(ProfileFailure(failure.message));
    }, (login) {
      emit(ProfileSuccessLocal(login));
    });


  }

  saveInfo() async {
    String? id = (await SharedPreferences.getInstance()).getString("id");
    String? userName = (await SharedPreferences.getInstance()).getString("userName");
    String? firstName = (await SharedPreferences.getInstance()).getString("firstName");
    String? lastName = (await SharedPreferences.getInstance()).getString("lastName");
    String? type = (await SharedPreferences.getInstance()).getString("type");
    String? email = (await SharedPreferences.getInstance()).getString("email");
    String? address = (await SharedPreferences.getInstance()).getString("address");
    String? telephone = (await SharedPreferences.getInstance()).getString("telephone");
    String? telegramId = (await SharedPreferences.getInstance()).getString("telegramId");
    this.id = id!;
    this.userName = userName!;
    this.firstName = firstName!;
    this.lastName = lastName!;
    this.type = type!;
    this.email = email!;
    this.address = address!;
    this.telephone = telephone!;
    this.telegramId =telegramId!;
    isLoggedIn = true;
  }

}
