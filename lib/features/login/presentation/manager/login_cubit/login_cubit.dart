import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toy_club_app/features/login/domain/use_cases/fetch_login_use_case.dart';
import 'package:toy_club_app/features/login/presentation/manager/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.fetchLoginUseCase,
      this.fetchLoginSUseCase,
      {required this.isLoggedIn,
      required this.id,
      required this.userName,
      required this.firstName,
      required this.lastName,
      required this.type,
      required this.email,
      required this.address,
      required this.telephone,
      required this.telegramId
      }) : super(LoginInitial());

  final FetchLoginUseCase fetchLoginUseCase;
  final FetchLoginSUseCase fetchLoginSUseCase;
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

  Future<void> fetchLoginData(Map<String, dynamic> data) async {
    emit(LoginLoading());

    var result = await fetchLoginUseCase.callLogin(data);

    result.fold((failure) {
      emit(LoginFailure(failure.message));
    }, (login) {
      emit(LoginSuccess(login));
    });
  }

  Future<void> logout() async {
    emit(LoginLoading());
    var result = await fetchLoginSUseCase.callLogout();

    result.fold((failure) {
      emit(LoginFailure(failure.message));
    }, (login) {
      this.isLoggedIn = false;
      saveInfo();
      emit(LoginSSuccess(login));
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
