import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxstatepractice/add_to_cart/cart_screen.dart';
import 'package:getxstatepractice/add_to_cart/controller.dart';
import 'package:getxstatepractice/add_to_cart/product_model.dart';

class PriductListScreen extends StatelessWidget {
  const PriductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());

    final List<Product> products = [
      Product(id: 1, name: 'T-Shirt', price: 150),
      Product(id: 2, name: 'Jeans', price: 120),
      Product(id: 3, name: 'Shirt', price: 200),
      Product(id: 4, name: 'Soaks', price: 170),
      Product(id: 5, name: 'Shoes', price: 2000),
      Product(id: 6, name: 'Cap', price: 150),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add To Cart Getx'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Get.to(() => const CartScreen()),
            icon: const Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return ListTile(
              title: Text(product.name),
              subtitle: Text('Price: \$${product.price}'),
              trailing: IconButton(
                onPressed: () {
                  cartController.addToCart(product);
                },
                icon: const Icon(Icons.add_shopping_cart),
              ),
            );
          }),
    );
  }
}
