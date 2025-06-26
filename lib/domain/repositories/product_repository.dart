import '../entities/product.dart';

// Abstract class for fetching product data.
// Useful for decoupling the implementation from business logic.
abstract class ProductRepository {
  Future<List<Product>> getProducts();
}
