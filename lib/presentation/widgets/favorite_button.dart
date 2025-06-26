import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/product_bloc.dart';
import '../blocs/product_state.dart';

class FavoriteButton extends StatelessWidget {
  final int productId;

  const FavoriteButton({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        final isFavorite =
            state is ProductLoaded && state.favorites.contains(productId);

        return IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : null,
          ),
          onPressed: () {
            context.read<ProductBloc>().add(ToggleFavorite(productId));
          },
        );
      },
    );
  }
}
