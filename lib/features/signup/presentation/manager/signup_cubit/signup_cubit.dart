import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:toy_club_app/features/signup/domain/use_cases/fetch_signup_use_case.dart';
import 'package:toy_club_app/features/signup/presentation/manager/signup_cubit/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.fetchSignupUseCase) : super(SignupInitial());

  final FetchSignupUseCase fetchSignupUseCase;

  Future<void> fetchSignupData(Map<String, dynamic> data) async {
    emit(SignupLoading());

    var result = await fetchSignupUseCase.callLogin(data);

    result.fold((failure) {
      emit(SignupFailure(failure.message));
    }, (signup) {
      emit(SignupSuccess(signup));
    });
  }

  Future<void> logout(int id) async {
    emit(SignupLoading());
    var result = await fetchSignupUseCase.callLogout(id);

    result.fold((failure) {
      emit(SignupFailure(failure.message));
    }, (signup) {
      emit(SignupSuccess(signup));
    });
  }
}
