import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:toy_club_app/features/orders/data/models/order_model.dart';
import 'package:toy_club_app/features/orders/domain/use_cases/fetch_order_use_case.dart';
import 'package:toy_club_app/features/orders/presentation/manager/ordre_cubit/order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this.fetchOrderUseCase) : super(OrderInitial());

  final FetchOrderUseCase fetchOrderUseCase;

  Future<void> fetchOrderData() async {
    emit(OrderLoading());

    var result = await fetchOrderUseCase.callOrder();

    result.fold((failure) {
      emit(OrderFailure(failure.message));
    }, (orderS) {
      emit(OrderSuccess(orderS as List<OrderS>));
    });
  }

  Future<void> addOrder(Map<String, dynamic> data1) async {
    emit(OrderLoading());

    var result = await fetchOrderUseCase.callAddOrder(data1);

    result.fold((failure) {
      emit(OrderFailure(failure.message));
    }, (orderS) {
      emit(OrderSuccess(orderS as List<OrderS>));
    });
  }

}
