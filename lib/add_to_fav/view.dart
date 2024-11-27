import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxstatepractice/add_to_cart/product_model.dart';
import 'package:getxstatepractice/add_to_fav/controller.dart';
import 'package:getxstatepractice/add_to_fav/fav_items.dart';

class ItemsList extends StatelessWidget {
  const ItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    final FavController favController = Get.put(FavController());
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
        title: const Text('Items'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const FavItems());
              },
              icon: const Icon(Icons.next_plan))
        ],
      ),
      body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            var product = products[index];
            return ListTile(
              title: Text(product.name),
              subtitle: Text(product.price.toString()),
              trailing: Obx(() {
                return IconButton(
                    onPressed: () {
                      favController.toggleFavItems(product);
                    },
                    icon: Icon(
                      product.isFav.value
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: product.isFav.value ? Colors.red : Colors.grey,
                    ));
              }),
            );
          }),
    );
  }
}
