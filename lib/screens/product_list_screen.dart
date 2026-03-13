import 'package:flutter/material.dart';
import 'package:flutter_cart_design/models/product.dart';
import 'package:flutter_cart_design/providers/cart_provider.dart';
import 'package:flutter_cart_design/screens/cart_screen.dart';
import 'package:flutter_cart_design/widgets/product_card.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  static final List<Product> products = [

    Product(
      id: "1",
      name: "iPhone 15",
      image: "https://picsum.photos/200",
      price: 90000,
    ),

    Product(
      id: "2",
      name: "MacBook",
      image: "https://picsum.photos/201",
      price: 150000,
    ),

    Product(
      id: "3",
      name: "AirPods",
      image: "https://picsum.photos/202",
      price: 20000,
    ),

    Product(
      id: "4",
      name: "Apple Watch",
      image: "https://picsum.photos/203",
      price: 45000,
    ),
  ];

  @override
  Widget build(BuildContext context) {

    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        actions: [

          Stack(
            children: [

              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CartScreen(),
                    ),
                  );
                },
              ),

              if (cart.itemCount > 0)
                Positioned(
                  right: 6,
                  top: 6,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.red,
                    child: Text(
                      cart.itemCount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                )
            ],
          )
        ],
      ),

      body: GridView.builder(
        padding: const EdgeInsets.all(10),

        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75,
        ),

        itemCount: products.length,

        itemBuilder: (context, index) {
          return ProductCard(product: products[index]);
        },
      ),
    );
  }
}