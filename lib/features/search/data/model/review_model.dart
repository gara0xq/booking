import '../../domain/entity/review_entity.dart';

class ReviewModel extends ReviewEntity {
  ReviewModel({
    required super.userId,
    required super.productId,
    required super.reviewText,
    required super.rating,
  });
  factory ReviewModel.fromMap(Map<String, dynamic> json) {
    return ReviewModel(
      userId: json['userId'],
      productId: json['productId'],
      reviewText: json['reviewText'],
      rating: json['rating'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'productId': productId,
      'reviewText': reviewText,
      'rating': rating,
    };
  }
}
