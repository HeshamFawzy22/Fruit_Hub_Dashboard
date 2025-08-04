// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:fruits_hub_dashboard/core/repos/product_repo/products_repo.dart';

import '../../../../../core/repos/images_repo/images_repo.dart';
import '../../../domain/entities/product_entity.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(
    this.imagesRepo,
    this.productsRepo,
  ) : super(AddProductCubitInitial());

  final ImagesRepo imagesRepo;
  final ProductsRepo productsRepo;

  Future<void> addProduct(ProductEntity addProductEntity) async {
    emit(AddProductCubitLoading());
    final result = await imagesRepo.uploadImage(addProductEntity.image);
    result
        .fold((failure) => emit(AddProductCubitError(message: failure.message)),
            (url) async {
      addProductEntity.imageUrl = url;
      var result = await productsRepo.addProduct(addProductEntity);
      result.fold(
        (failure) => emit(
          AddProductCubitError(message: failure.message),
        ),
        (success) => emit(
          AddProductCubitSuccess(message: 'تم اضافة المنتج بنجاح'),
        ),
      );
    });
  }
}
