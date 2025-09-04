class ProductModel{
  final String imagePath;
  final String title ;
  final String subtitle;
  final String price;
  final String oldPrice;
  final String discount;
  final String rating;
  final String reviews;

  ProductModel({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.rating,
    required this.reviews,
  });
}
