import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:toy_club_app/features/signup/data/models/signup_model.dart';
import 'package:toy_club_app/features/signup/domain/use_cases/fetch_signup_use_case.dart';
import 'package:toy_club_app/features/signup/presentation/manager/signup_cubit/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.fetchSignupUseCase) : super(SignupInitial());

  final FetchSignupUseCase fetchSignupUseCase;

  Future<void> fetchSignupData(SignUp data) async {
    emit(SignupLoading());
    Map<String, dynamic> data1 = data.toJson();
    var result = await fetchSignupUseCase.callLogin(data1);

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
