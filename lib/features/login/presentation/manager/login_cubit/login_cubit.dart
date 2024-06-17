import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:toy_club_app/features/login/domain/use_cases/fetch_login_use_case.dart';
import 'package:toy_club_app/features/login/presentation/manager/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.fetchLoginUseCase) : super(LoginInitial());

  final FetchLoginUseCase fetchLoginUseCase;

  Future<void> fetchLoginData(Map<String, dynamic> data) async {
    emit(LoginLoading());

    var result = await fetchLoginUseCase.callLogin(data);

    result.fold((failure) {
      emit(LoginFailure(failure.message));
    }, (login) {
      emit(LoginSuccess(login));
    });
  }

  Future<void> logout(int id) async {
    emit(LoginLoading());
    var result = await fetchLoginUseCase.callLogout(id);

    result.fold((failure) {
      emit(LoginFailure(failure.message));
    }, (login) {
      emit(LoginSuccess(login));
    });
  }
}
