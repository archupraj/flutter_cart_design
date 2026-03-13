import 'package:flutter/material.dart';
import 'package:flutter_cart_design/models/cart_item.dart';
import 'package:flutter_cart_design/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CartItemTile extends StatelessWidget {
  final CartItem item;

  const CartItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);

    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: CachedNetworkImage(
          imageUrl: item.product.image,
          width: 50,
          placeholder: (_, __) => const CircularProgressIndicator(),
          errorWidget: (_, __, ___) => const Icon(Icons.error),
        ),
        title: Text(item.product.name),
        subtitle: Text("₹${item.product.price}"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                cart.decreaseQuantity(item.product.id);
              },
            ),
            Text(item.quantity.toString()),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                cart.increaseQuantity(item.product.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}