import 'package:dartz/dartz.dart';
import 'package:toy_club_app/core/errors/failure.dart';
import 'package:toy_club_app/features/profile/domain/repos/profile_repo.dart';
import 'package:toy_club_app/features/signup/data/models/signup_model.dart';

import 'use_case.dart';

class FetchProfileUseCase extends UseCase<SignUp, NoParam> {
  final ProfileRepo profileRepo;
  FetchProfileUseCase(this.profileRepo);


  @override
  Future<Either<Failure, SignUp>> call(Map<String,dynamic> data2,[NoParam? param]) async{
    return await profileRepo.fetchProfile(data2);
  }

  @override
  Future<Either<Failure, SignUp>> calldelete([NoParam? param]) async{
    // TODO: implement calldelete
    throw UnimplementedError();
  }


}

class FetchProfileSUseCase extends UseCase<String, NoParam> {
  final ProfileRepo profileRepo;
  FetchProfileSUseCase(this.profileRepo);

  @override
  Future<Either<Failure, String>> call(Map<String, dynamic> data2, [NoParam? param]) {
    // TODO: implement call
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> calldelete([NoParam? param]) async{
    return await profileRepo.fetchDelete();
  }

}