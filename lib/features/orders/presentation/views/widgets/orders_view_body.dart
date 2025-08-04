import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/helper_functions/get_dummy_order.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/filter_section.dart';

import 'orders_items_list_view.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key, required this.orders});
  final List<OrderEntity> orders;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const FilterSection(),
          const SizedBox(height: 16.0),
          Expanded(
            child: OrdersItemsListView(
              orders: orders.isEmpty
                  ? [getDummyOrders()] // Use dummy orders if the list is empty
                  : orders,
            ),
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
