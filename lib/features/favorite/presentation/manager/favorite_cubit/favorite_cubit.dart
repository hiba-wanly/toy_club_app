import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:toy_club_app/features/favorite/domain/use_cases/fetch_favorite_use_case.dart';
import 'package:toy_club_app/features/favorite/presentation/manager/favorite_cubit/favorite_state.dart';


class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.fetchFavoriteUseCase) : super(FavoriteInitial());

  final FetchFavoriteUseCase fetchFavoriteUseCase;

  Future<void> fetchFavoriteData() async {
    emit(FavoriteLoading());

    var result = await fetchFavoriteUseCase.callFavorite();

    result.fold((failure) {
      emit(FavoriteFailure(failure.message));
    }, (favorite) {
      emit(FavoriteSuccess(favorite));
    });
  }

  Future<void> addFavoriteToy(Map<String, dynamic> data) async {
    emit(FavoriteLoading());

    var result = await fetchFavoriteUseCase.callAddFavorite(data);

    result.fold((failure) {
      emit(FavoriteFailure(failure.message));
    }, (favorite) {
      emit(FavoriteSuccess(favorite));
    });
  }

  // Future<void> deleteFavoriteToy(int data) async {
  //   emit(FavoriteDLoading());
  //
  //   var result = await fetchFavoriteUseCase.callDeleteFavorite(data);
  //
  //   result.fold((failure) {
  //     emit(FavoriteDFailure(failure.message));
  //   }, (favorite) {
  //     emit(FavoriteDSuccess(favorite));
  //   });
  // }


}
