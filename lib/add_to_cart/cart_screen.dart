import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxstatepractice/add_to_cart/controller.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (cartController.cartProducts.isEmpty) {
          return const Text('Add a Product first');
        }
        return ListView.builder(
            itemCount: cartController.cartProducts.length,
            itemBuilder: (context, index) {
              final product = cartController.cartProducts[index];
              return ListTile(
                title: Text(product.name),
                subtitle: Text(product.price.toString()),
                trailing: IconButton(
                    onPressed: () {
                      cartController.removeFromCart(product);
                      Get.snackbar(
                        'Removed to Cart',
                        '${product.name} has been removed!',
                        snackPosition: SnackPosition.BOTTOM,
                        duration: const Duration(seconds: 2),
                      );
                    },
                    icon: const Icon(Icons.remove_circle_outline)),
              );
            });
      }),
      bottomNavigationBar: Obx(() {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Total Items: ${cartController.itemCount}'),
              Text('Total Price: ${cartController.totalPrice}'),
            ],
          ),
        );
      }),
    );
  }
}
