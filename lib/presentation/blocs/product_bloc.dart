import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repositories/product_repository.dart';
import 'product_state.dart';

// Events that trigger changes in the product BLoC.
abstract class ProductEvent {}

class LoadProducts extends ProductEvent {}

class ToggleFavorite extends ProductEvent {
  final int productId;
  ToggleFavorite(this.productId);
}

// BLoC responsible for managing product loading and favorite toggling.
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;

  ProductBloc(this.repository) : super(ProductInitial()) {
    // Register event handlers.
    on<LoadProducts>(_onLoadProducts);
    on<ToggleFavorite>(_onToggleFavorite);
  }

  // Handle the LoadProducts event: fetch products and update state.
  Future<void> _onLoadProducts(
      LoadProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      final products = await repository.getProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError('Failed to load products'));
    }
  }

  // Handle the ToggleFavorite event: add or remove from favorites.
  void _onToggleFavorite(ToggleFavorite event, Emitter<ProductState> emit) {
    if (state is ProductLoaded) {
      final currentState = state as ProductLoaded;
      final newFavorites = Set<int>.from(currentState.favorites);

      if (newFavorites.contains(event.productId)) {
        newFavorites.remove(event.productId);
      } else {
        newFavorites.add(event.productId);
      }

      // Emit new state with updated favorites.
      emit(ProductLoaded(currentState.products, newFavorites));
    }
  }
}
