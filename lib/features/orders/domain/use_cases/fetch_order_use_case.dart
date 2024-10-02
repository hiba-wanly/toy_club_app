import 'package:dartz/dartz.dart';
import 'package:toy_club_app/core/errors/failure.dart';
import 'package:toy_club_app/features/orders/data/models/order_model.dart';
import 'package:toy_club_app/features/orders/domain/repos/order_repo.dart';

import 'use_case.dart';

class FetchOrderUseCase extends UseCase<List<OrderS>, NoParam> {
  final OrderRepo orderRepo;
  FetchOrderUseCase(this.orderRepo);


  @override
  Future<Either<Failure, List<OrderS>>> callOrder(
      [NoParam? param]) async {
    return await orderRepo.fetchOrderData();
  }

  @override
  Future<Either<Failure, List<OrderS>>> callAddOrder(Map<String, dynamic> data1, [NoParam? param]) async{
    return await orderRepo.addOrderData(data1);
  }
}
