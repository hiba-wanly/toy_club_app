import 'package:dartz/dartz.dart';
import 'package:toy_club_app/core/errors/failure.dart';
import 'package:toy_club_app/features/home/data/models/toys_model.dart';
import 'package:toy_club_app/features/home/domain/repos/home_repo.dart';

import 'use_case.dart';

class FetchHomeUseCase extends UseCase<Toys, NoParam> {
  final HomeRepo homeRepo  ;
  FetchHomeUseCase(this.homeRepo);


  @override
  Future<Either<Failure, Toys>> callHome(
      [NoParam? param]) async {
    return await homeRepo.fetchHomeData();
  }
}
