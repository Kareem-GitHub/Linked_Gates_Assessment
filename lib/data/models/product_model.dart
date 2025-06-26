import '../../domain/entities/product.dart';

// Concrete data model extending the Product entity.
// Used for mapping and converting JSON data to Product objects.
class ProductModel extends Product {
  ProductModel({
    required super.id,
    required super.title,
    required super.description,
    required super.image,
    required super.price,
  });

  // Factory method to create a ProductModel from a JSON map.
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    List images = json['images'] ?? [];

    // Fallback image in case the list is empty.
    String image =
        images.isNotEmpty ? images[0] : 'https://via.placeholder.com/150';

    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'] ?? '',
      image: image,
      price: json['price'],
    );
  }
}
