// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:fruits_hub_dashboard/core/repos/product_repo/products_repo.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';
import 'package:fruits_hub_dashboard/core/utils/backend_endpoint.dart';

import '../../../features/add_product/data/models/product_model.dart';
import '../../../features/add_product/domain/entities/product_entity.dart';
import '../../errors/failures.dart';

class ProductsRepoImp implements ProductsRepo {
  final DatabaseService databaseService;
  ProductsRepoImp({
    required this.databaseService,
  });
  @override
  Future<Either<Failure, void>> addProduct(
      ProductEntity addProductEntity) async {
    try {
      await databaseService.addData(
          path: BackendEndpoint.products,
          data: AddProductModel.fromEntity(addProductEntity).toJson());
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('فشل اضافة المنتج'));
    }
  }
}
