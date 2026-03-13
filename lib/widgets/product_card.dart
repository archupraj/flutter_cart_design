import 'package:flutter/material.dart';
import 'package:flutter_cart_design/models/product.dart';
import 'package:flutter_cart_design/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';


class ProductCard extends StatelessWidget {

  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {

    final cart = Provider.of<CartProvider>(context, listen: false);

    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),

      elevation: 3,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Image
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),

              child: CachedNetworkImage(
                imageUrl: product.image,
                width: double.infinity,
                fit: BoxFit.cover,

                placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),

                errorWidget: (context, url, error) =>
                const Icon(Icons.error),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  product.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  "₹${product.price}",
                  style: const TextStyle(
                    color: Colors.green,
                  ),
                ),

                const SizedBox(height: 8),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      cart.addToCart(product);
                    },
                    child: const Text("Add to Cart"),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}