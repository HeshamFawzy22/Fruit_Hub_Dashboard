// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:fruits_hub_dashboard/features/add_product/data/models/review_model.dart';

import '../../domain/entities/product_entity.dart';

class AddProductModel {
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
  final int sellingCount;
  final List<ReviewModel> reviews;

  AddProductModel({
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
    this.sellingCount = 0,
    required this.reviews,
  });

  factory AddProductModel.fromEntity(ProductEntity productEntity) {
    return AddProductModel(
        reviews: productEntity.reviews
            .map((e) => ReviewModel.fromEntity(e))
            .toList(),
        name: productEntity.name,
        code: productEntity.code,
        description: productEntity.description,
        price: productEntity.price,
        image: productEntity.image,
        imageUrl: productEntity.imageUrl,
        isOrganic: productEntity.isOrganic,
        idFeaturedItem: productEntity.idFeaturedItem,
        expirationMonths: productEntity.expirationMonths,
        numOfCalories: productEntity.numOfCalories,
        unitAmount: productEntity.unitAmount);
  }

  toJson() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'sellingCount': sellingCount,
      'idFeaturedItem': idFeaturedItem,
      'imageUrl': imageUrl,
      'expirationMonths': expirationMonths,
      'numOfCalories': numOfCalories,
      'unitAmount': unitAmount,
      'isOrganic': isOrganic,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}
