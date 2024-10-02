import 'package:dartz/dartz.dart';
import 'package:toy_club_app/core/errors/failure.dart';
import 'package:toy_club_app/features/favorite/data/models/favorite_model.dart';
import 'package:toy_club_app/features/favorite/domain/repos/favorite_repo.dart';


import 'use_case.dart';

class FetchFavoriteUseCase extends UseCase<List<Favorite>, NoParam> {
  final FavoriteRepo favoriteRepo;
  FetchFavoriteUseCase(this.favoriteRepo);


  @override
  Future<Either<Failure, List<Favorite>>> callFavorite(
      [NoParam? param]) async {
    return await favoriteRepo.fetchFavoriteData();
  }

  @override
  Future<Either<Failure, List<Favorite>>> callAddFavorite(Map<String, dynamic> data, [NoParam? param]) async{
    return await favoriteRepo.addFavoriteData(data);
  }

  @override
  Future<Either<Failure, List<Favorite>>> callDeleteFavorite(int data, [NoParam? param]) async{
    return await favoriteRepo.deleteFavoriteData(data);
  }


}
