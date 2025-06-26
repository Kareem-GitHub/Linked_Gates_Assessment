import 'package:flutter/material.dart';
import 'package:linkedgates_assessment/presentation/widgets/favorite_button.dart';
import 'package:linkedgates_assessment/presentation/widgets/size_chip.dart';
import '../../../domain/entities/product.dart';

// Widget to display a single product tile in the list.
class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.04,
        vertical: MediaQuery.of(context).size.height * 0.006,
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Product image on the left
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.25,
              child: AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    product.image,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, _) =>
                        const Icon(Icons.broken_image, size: 50),
                  ),
                ),
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.045),

            // Product information on the right
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title, description, price, and rating
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        product.description,
                        style: const TextStyle(fontSize: 14),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '\$${product.price}',
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Row(
                        children: [
                          Icon(Icons.star, size: 16, color: Colors.orange),
                          SizedBox(width: 4),
                          Text(
                            '4.8 Ratings',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  // Available size chips
                  Row(
                    children: const [
                      Text(
                        'Size ',
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(width: 6),
                      SizeChip(label: 'S'),
                      SizedBox(width: 6),
                      SizeChip(label: 'M'),
                      SizedBox(width: 6),
                      SizeChip(label: 'L'),
                    ],
                  ),
                ],
              ),
            ),

            // Like/favorite button
            Align(
              alignment: Alignment.topCenter,
              child: FavoriteButton(productId: product.id),
            ),
          ],
        ),
      ),
    );
  }
}
