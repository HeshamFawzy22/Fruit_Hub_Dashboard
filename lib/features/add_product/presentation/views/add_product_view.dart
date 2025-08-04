import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/manager/cubit/add_product_cubit.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/add_product_view_body_bloc_consumer.dart';
import '../../../../core/repos/images_repo/images_repo.dart';
import '../../../../core/repos/product_repo/products_repo.dart';
import '../../../../core/widgets/build_app_bar.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  static const String routeName = 'add_product';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'اضافة منتج'),
      body: BlocProvider(
        create: (context) => AddProductCubit(
          getIt.get<ImagesRepo>(),
          getIt.get<ProductsRepo>(),
        ),
        child: AddProductViewBodyBlocConsumer(),
      ),
    );
  }
}


