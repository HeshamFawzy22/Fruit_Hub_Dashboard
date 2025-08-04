import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/manager/cubit/add_product_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/helper_functions/build_custom_snack_bar.dart';
import 'add_product_view_body.dart';

class AddProductViewBodyBlocConsumer extends StatelessWidget {
  const AddProductViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if(state is AddProductCubitSuccess){
          buildCustomSnackBar(context, state.message, Colors.green);
        }
        if(state is AddProductCubitError){
          buildCustomSnackBar(context, state.message, Colors.red);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AddProductCubitLoading? true : false,
          child: AddProductViewBody(),
        );
      },
    );
  }
  
  
}
