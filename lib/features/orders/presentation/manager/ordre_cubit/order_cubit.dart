import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:toy_club_app/features/orders/domain/use_cases/fetch_order_use_case.dart';
import 'package:toy_club_app/features/orders/presentation/manager/ordre_cubit/order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this.fetchOrderUseCase) : super(OrderInitial());

  final FetchOrderUseCase fetchOrderUseCase;

  Future<void> fetchOrderData(Map<String, dynamic> data) async {
    emit(OrderLoading());

    var result = await fetchOrderUseCase.callOrder(data);

    result.fold((failure) {
      emit(OrderFailure(failure.message));
    }, (orderS) {
      emit(OrderSuccess(orderS));
    });
  }

}
