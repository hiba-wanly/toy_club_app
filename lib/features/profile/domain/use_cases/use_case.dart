import 'package:dartz/dartz.dart';
import 'package:toy_club_app/core/errors/failure.dart';

abstract class UseCase<Type , Param>{
  Future<Either<Failure,Type>> call(Map<String,dynamic> data2,[Param param]);
  Future<Either<Failure,Type>> calldelete([Param param]);
}
class NoParam{}