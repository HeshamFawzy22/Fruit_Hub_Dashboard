// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:meta/meta.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/repos/orders_repo.dart';
part 'fetch_orders_state.dart';

class FetchOrdersCubit extends Cubit<FetchOrdersState> {
  FetchOrdersCubit(
    this.ordersRepo,
  ) : super(FetchOrdersInitial());

  final OrdersRepo ordersRepo;
  StreamSubscription? _streamSubscription;

  // void fetchOrders() async {
  //   emit(FetchOrdersLoading());
  //   await for (var result in ordersRepo.fetchOrders()) {
  //     result.fold(
  //       (failure) => emit(FetchOrdersFailure(failure.message)),
  //       (orders) => emit(FetchOrdersSuccess(orders: orders)),
  //     );
  //   }
  // }

  // استخدمت ال listen هنا علشان ال stream ميفضلش مفتوح على طول بحيث اقدر اقفله لو مفيش داتا جايه
  void fetchOrdersByListening() {
    emit(FetchOrdersLoading());
    _streamSubscription = ordersRepo.fetchOrders().listen((result) {
      result.fold(
        (failure) => emit(FetchOrdersFailure(failure.message)),
        (orders) => emit(FetchOrdersSuccess(orders: orders)),
      );
    });
  }

  // ودا اللى حصل هنا
  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
