import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../errors/failures.dart';

abstract class ImagesRepo {
  // import dartz for using Either and Failure
  Future<Either<Failure, String>> uploadImage(File image);
}