// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:fruits_hub_dashboard/features/add_product/domain/entities/review_entity.dart';

class ProductEntity {
  final String name;
  final String code;
  final String description;
  final num price;
  final File image;
  final bool idFeaturedItem;
  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;
  final int numOfCalories;
  final num avgRating = 0;
  final num totalRating = 0;
  final int unitAmount;
  final List<ReviewEntity> reviews;
  

  ProductEntity({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.image,
    required this.idFeaturedItem,
    this.imageUrl,
    required this.expirationMonths,
    this.isOrganic = false,
    required this.numOfCalories,
    required this.unitAmount,
    required this.reviews,
  });
  
}
