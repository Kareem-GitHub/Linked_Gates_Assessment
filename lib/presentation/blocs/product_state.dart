import '../../../domain/entities/product.dart';

// Represents all possible states for product loading and interaction.
abstract class ProductState {}

// Initial state before any action is taken.
class ProductInitial extends ProductState {}

// State while products are being fetched.
class ProductLoading extends ProductState {}

// State when products have been successfully fetched.
// Also includes favorite tracking.
class ProductLoaded extends ProductState {
  final List<Product> products;
  final Set<int> favorites;

  ProductLoaded(this.products, [Set<int>? favorites])
      : favorites = favorites ?? {};
}

// State when an error occurs during fetching.
class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
}
