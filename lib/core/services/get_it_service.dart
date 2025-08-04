import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/product_repo/products_repo.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';
import 'package:fruits_hub_dashboard/core/services/firestore_service.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/repos/orders_repo.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/repos/orders_repo_imp.dart';
import 'package:get_it/get_it.dart';

import '../repos/images_repo/images_repo_imp.dart';
import '../repos/product_repo/products_repo_imp.dart';
import 'supabase_storage_service.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // Register services
  getIt.registerSingleton<StorageService>(SupabaseStorageService());
  getIt.registerSingleton<DatabaseService>(FirestoreService());
  getIt.registerSingleton<ImagesRepo>(
    ImagesRepoImp(
      storageService: getIt.get<StorageService>(),
    ),
  );
  getIt.registerSingleton<ProductsRepo>(
    ProductsRepoImp(
      databaseService: getIt.get<DatabaseService>(),
    ),
  );

  getIt.registerSingleton<OrdersRepo>(
    OrdersRepoImp(
      getIt.get<DatabaseService>(),
    ),
  );
}
