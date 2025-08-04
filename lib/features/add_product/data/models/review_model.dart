import '../../domain/entities/review_entity.dart';

class ReviewModel{
  final String name;
  final String image;
  final num ratting;
  final String date;
  final String reviewDescreption;

  ReviewModel({
    required this.name,
    required this.image,
    required this.ratting,
    required this.date,
    required this.reviewDescreption,
  });

  factory ReviewModel.fromEntity(ReviewEntity entity) {
    return ReviewModel(
      name: entity.name,
      image: entity.image,
      ratting: entity.ratting,
      date: entity.date,
      reviewDescreption: entity.reviewDescreption,
    );
  }

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name'],
      image: json['image'],
      ratting: json['ratting'],
      date: json['date'],
      reviewDescreption: json['reviewDescreption'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'ratting': ratting,
      'date': date,
      'reviewDescreption': reviewDescreption,
    };
  }
}