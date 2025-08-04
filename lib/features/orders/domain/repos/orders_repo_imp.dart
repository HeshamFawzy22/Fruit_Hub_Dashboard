import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/enums/order_enum.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';
import 'package:fruits_hub_dashboard/core/utils/backend_endpoint.dart';
import 'package:fruits_hub_dashboard/features/orders/data/models/order_model.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/repos/orders_repo.dart';

class OrdersRepoImp implements OrdersRepo {
  final DatabaseService _databaseService;

  OrdersRepoImp(this._databaseService);
  // @override
  // Future<Either<Failure, List<OrderEntity>>> getOrders() async {
  //   try {
  //     final data = await _databaseService.getData(path: BackendEndpoint.orders);
  //     List<OrderEntity> orders = (data as List<dynamic>)
  //         .map<OrderEntity>((e) => OrderModel.fromJson(e).toEntity())
  //         .toList();
  //     // log('Fetched orders: $data');
  //     return Right(orders);
  //   } catch (e) {
  //     return Left(ServerFailure(e.toString()));
  //   }
  // }

  @override
  Stream<Either<Failure, List<OrderEntity>>> fetchOrders() async* {
    try {
      await for (var data
          in _databaseService.streamData(path: BackendEndpoint.orders, query: {
            'orderBy': 'createdAt',
            'desc': true,
          })) {
        List<OrderEntity> orders = (data as List<dynamic>)
            .map<OrderEntity>((e) => OrderModel.fromJson(e).toEntity())
            .toList();
        log('Fetched orders: $data');
        yield Right(orders);
      }
    } catch (e) {
      yield Left(ServerFailure('failed to fetch orders: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> updateOrderStatus(
      {required String orderId, required OrderStatus status}) async {
    try {
      await _databaseService.updateData(
          path: BackendEndpoint.updateOrderStatus,
          data: {
            'status': status.name,
          },
          documentId: orderId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
