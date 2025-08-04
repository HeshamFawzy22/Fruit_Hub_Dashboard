import 'package:dartz/dartz.dart';

import '../../../features/add_product/domain/entities/product_entity.dart';
import '../../errors/failures.dart';

abstract class ProductsRepo {
  Future<Either<Failure, void>> addProduct(ProductEntity addProductEntity);
}