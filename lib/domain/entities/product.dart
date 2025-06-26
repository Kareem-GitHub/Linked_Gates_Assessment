// Base entity representing a product in the app.
class Product {
  final int id;
  final String title;
  final String description;
  final String image;
  final num price;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
  });
}
