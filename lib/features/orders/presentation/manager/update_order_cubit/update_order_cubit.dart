// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:fruits_hub_dashboard/core/enums/order_enum.dart';
import 'package:meta/meta.dart';

import 'package:fruits_hub_dashboard/features/orders/domain/repos/orders_repo.dart';

part 'update_order_state.dart';

class UpdateOrderCubit extends Cubit<UpdateOrderState> {
  UpdateOrderCubit(
    this.ordersRepo,
  ) : super(UpdateOrderInitial());

  final OrdersRepo ordersRepo;

  Future<void> updateOrderStatus(
      {required OrderStatus status, required String orderId}) async {
    final result =
        await ordersRepo.updateOrderStatus(orderId: orderId, status: status);
    result.fold((failure) => emit(UpdateOrderFailure(error: failure.message)),
        (success) => emit(UpdateOrderSuccess()));
  }
}
