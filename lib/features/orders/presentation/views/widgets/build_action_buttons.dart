// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/enums/order_enum.dart';

import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/manager/update_order_cubit/update_order_cubit.dart';

class BuildActionButtons extends StatelessWidget {
  const BuildActionButtons({
    Key? key,
    required this.orderEntity,
  }) : super(key: key);
  final OrderEntity orderEntity;
  @override
  Widget build(BuildContext context) {
    final orderCubit = context.read<UpdateOrderCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
            visible: orderEntity.status == OrderStatus.pending,
            child: ElevatedButton(
                onPressed: () {
                  orderCubit.updateOrderStatus(
                      status: OrderStatus.accepted,
                      orderId: orderEntity.orderId);
                },
                child:
                    const Text('قبول', style: TextStyle(color: Colors.black)))),
        const SizedBox(width: 8),
        Visibility(
            visible: orderEntity.status == OrderStatus.pending,
            child: ElevatedButton(
                onPressed: () {
                  orderCubit.updateOrderStatus(
                      status: OrderStatus.cancelled,
                      orderId: orderEntity.orderId);
                },
                child: const Text('رفض', style: TextStyle(color: Colors.red)))),
        Visibility(
            visible: orderEntity.status == OrderStatus.accepted,
            child: ElevatedButton(
                onPressed: () {
                  orderCubit.updateOrderStatus(
                      status: OrderStatus.delivered,
                      orderId: orderEntity.orderId);
                },
                child:
                    const Text('وصل', style: TextStyle(color: Colors.green)))),
      ],
    );
  }
}
