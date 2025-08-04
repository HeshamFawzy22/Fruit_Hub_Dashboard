import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/helper_functions/get_dummy_order.dart';
import 'package:fruits_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruits_hub_dashboard/core/widgets/build_app_bar.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/repos/orders_repo.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/manager/fetch_order_cubit/fetch_orders_cubit.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/manager/update_order_cubit/update_order_cubit.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/orders_view_body.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/update_order_builder.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({super.key});

  static const String routeName = 'orders';

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchOrdersCubit(
            getIt.get<OrdersRepo>(),
          ),
        ),
        BlocProvider(
          create: (context) => UpdateOrderCubit(
            getIt.get<OrdersRepo>(),
          ),
        ),
      ],
      child: Scaffold(
        appBar: buildAppBar(context, 'الطلبات'),
        body: UpdateOrderBuilder(child: OrdersViewBodyBlocBuilder()),
      ),
    );
  }
}

class OrdersViewBodyBlocBuilder extends StatefulWidget {
  const OrdersViewBodyBlocBuilder({super.key});

  @override
  State<OrdersViewBodyBlocBuilder> createState() =>
      _OrdersViewBodyBlocBuilderState();
}

class _OrdersViewBodyBlocBuilderState extends State<OrdersViewBodyBlocBuilder> {
  @override
  void initState() {
    super.initState();
    context.read<FetchOrdersCubit>().fetchOrdersByListening();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchOrdersCubit, FetchOrdersState>(
      builder: (context, state) {
        if (state is FetchOrdersSuccess) {
          return OrdersViewBody(
            orders: state.orders,
          );
        } else if (state is FetchOrdersFailure) {
          return Center(child: Text('Error: ${state.error}'));
        } else {
          return Skeletonizer(
            child: OrdersViewBody(
              orders: [getDummyOrders(), getDummyOrders(), getDummyOrders()],
            ),
          );
          // const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
