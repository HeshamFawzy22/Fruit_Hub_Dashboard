import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/order_item.dart';

class OrdersItemsListView extends StatelessWidget {
  const OrdersItemsListView({super.key, required this.orders});

  final List<OrderEntity> orders;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      
      itemBuilder: (context, index) {
        return OrderItem(
          order: orders[index],
        );
      },
      itemCount: orders.length,
    );
  }
}
