import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:toy_club_app/features/favorite/domain/use_cases/fetch_favorite_use_case.dart';
import 'package:toy_club_app/features/favorite/presentation/manager/favorite_cubit/delete_favorite_state.dart';


class FavoriteDCubit extends Cubit<FavoriteDState> {
  FavoriteDCubit(this.fetchFavoriteUseCase) : super(FavoriteDInitial());

  final FetchFavoriteUseCase fetchFavoriteUseCase;


  Future<void> deleteFavoriteToy(int data) async {
    emit(FavoriteDLoading());

    var result = await fetchFavoriteUseCase.callDeleteFavorite(data);

    result.fold((failure) {
      emit(FavoriteDFailure(failure.message));
    }, (favorite) {
      emit(FavoriteDSuccess(favorite));
    });
  }


}
