import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:toy_club_app/features/home/domain/use_cases/fetch_home_use_case.dart';
import 'package:toy_club_app/features/home/presentation/manager/home_cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.fetchHomeUseCase) : super(HomeInitial());

  final FetchHomeUseCase fetchHomeUseCase;

  Future<void> fetchHomeData() async {
    emit(HomeLoading());

    var result = await fetchHomeUseCase.callHome();

    result.fold((failure) {
      emit(HomeFailure(failure.message));
    }, (toys) {
      emit(HomeSuccess(toys));
    });
  }

}
