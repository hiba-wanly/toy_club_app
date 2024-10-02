import 'package:dartz/dartz.dart';
import 'package:toy_club_app/core/errors/failure.dart';
import 'package:toy_club_app/features/login/data/models/login_model.dart';
import 'package:toy_club_app/features/login/domain/repos/login_repo.dart';
import 'package:toy_club_app/features/signup/data/models/signup_model.dart';

import 'use_case.dart';

class FetchLoginUseCase extends UseCase<SignUp, NoParam> {
  final LoginRepo loginRepo;
  FetchLoginUseCase(this.loginRepo);



  @override
  Future<Either<Failure, SignUp>> callLogin(Map<String, dynamic> data2,
      [NoParam? param]) async {
    return await loginRepo.fetchLoginData(data2);
  }

  @override
  Future<Either<Failure, SignUp>> callLogout([NoParam? param]) {
    // TODO: implement callLogout
    throw UnimplementedError();
  }
}


class FetchLoginSUseCase extends UseCase<String, NoParam> {
  final LoginRepo loginRepo;
  FetchLoginSUseCase(this.loginRepo);
@override
Future<Either<Failure, String>> callLogout( [NoParam? param]) async {
  return await loginRepo.logoutUser();
}

  @override
  Future<Either<Failure, String>> callLogin(Map<String, dynamic> data2, [NoParam? param]) {
    // TODO: implement callLogin
    throw UnimplementedError();
  }
}
