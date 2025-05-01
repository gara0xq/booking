class ReviewEntity {
  final String userId;
  final String productId;
  final String reviewText;
  final int rating;

  ReviewEntity({
    required this.userId,
    required this.productId,
    required this.reviewText,
    required this.rating,
  });
}
