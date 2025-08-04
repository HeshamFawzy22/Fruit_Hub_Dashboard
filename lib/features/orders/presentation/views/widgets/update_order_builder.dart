// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/helper_functions/build_error_bar.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/manager/update_order_cubit/update_order_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateOrderBuilder extends StatelessWidget {
  const UpdateOrderBuilder({
    super.key,
    required this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateOrderCubit, UpdateOrderState>(
        listener: (context, state) {
      if (state is UpdateOrderSuccess) {}
      if (state is UpdateOrderFailure) {
        log(state.error);
        showBar(context, state.error);
      }
    }, builder: (context, state) {
      return ModalProgressHUD(
          inAsyncCall: state is UpdateOrderLoading, child: child);
    });
  }
}
