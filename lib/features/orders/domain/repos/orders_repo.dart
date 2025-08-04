import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/enums/order_enum.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';

abstract class OrdersRepo {
  // Future<Either<Failure, List<OrderEntity>>> fetchOrders();
  Stream<Either<Failure, List<OrderEntity>>> fetchOrders();
  Future<Either<Failure, void>> updateOrderStatus({
    required String orderId,
    required OrderStatus status,
  });
  // Future<Either<Failure, void>> deleteOrder(String orderId);
}