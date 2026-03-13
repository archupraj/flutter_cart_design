import 'package:flutter/material.dart';
import 'package:flutter_cart_design/providers/cart_provider.dart';
import 'package:flutter_cart_design/widgets/cart_item_tile.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final cart = Provider.of<CartProvider>(context);

    final items = cart.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
      ),

      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return CartItemTile(item: items[index]);
              },
            ),
          ),

          Container(
            padding: const EdgeInsets.all(16),

            child: Text(
              "Total Price: ₹${cart.totalPrice.toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}