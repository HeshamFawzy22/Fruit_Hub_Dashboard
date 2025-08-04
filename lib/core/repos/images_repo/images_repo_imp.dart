// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_dashboard/core/utils/backend_endpoint.dart';

import '../../errors/failures.dart';
import '../../services/storage_service.dart';

class ImagesRepoImp implements ImagesRepo {
  final StorageService storageService;
  ImagesRepoImp({
    required this.storageService,
  });
  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      String url =
          await storageService.uploadFile(image, BackendEndpoint.images);
      return Right(url);
    } catch (e) {
      return Left(ServerFailure('فشل رفع الصورة'));
    }
  }
}
