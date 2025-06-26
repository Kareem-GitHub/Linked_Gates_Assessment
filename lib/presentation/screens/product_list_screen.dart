import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkedgates_assessment/presentation/widgets/error_view.dart';
import 'package:linkedgates_assessment/presentation/widgets/no_products_view.dart';
import '../blocs/product_bloc.dart';
import '../blocs/product_state.dart';
import '../widgets/product_tile.dart';
import '../widgets/shimmer_loader.dart';

// Main screen displaying the list of products.
class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product List')),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          // Show shimmer while data is loading.
          if (state is ProductLoading) {
            return const ShimmerLoader();

            // If products loaded successfully.
          } else if (state is ProductLoaded) {
            // If the product list is empty, show fallback view.
            if (state.products.isEmpty) {
              return const NoProductView(message: 'Please check back later.');
            }

            // Otherwise, show the list of products.
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                return ProductTile(product: state.products[index]);
              },
            );

            // If an error occurred while loading.
          } else if (state is ProductError) {
            return ErrorView(message: state.message);
          }

          // Default fallback (should not normally happen).
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
