class ShoppingModel {
  final String title;
  final List<String> variations;
  final double rating;
  final double price;
  final double originalPrice;
  final int discountPercent;
  final String imageUrl;

  ShoppingModel({
    required this.title,
    required this.variations,
    required this.rating,
    required this.price,
    required this.originalPrice,
    required this.discountPercent,
    required this.imageUrl,
  });
}
