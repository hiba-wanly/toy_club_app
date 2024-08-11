import 'package:dartz/dartz.dart';
import 'package:toy_club_app/core/errors/failure.dart';
import 'package:toy_club_app/features/orders/data/models/order_model.dart';
abstract class OrderRepo {
  Future<Either<ServerFailure, OrderS >> fetchOrderData(
      Map<String, dynamic> data2);
}
