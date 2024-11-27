import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxstatepractice/add_to_fav/controller.dart';

class FavItems extends StatelessWidget {
  const FavItems({super.key});

  @override
  Widget build(BuildContext context) {
    final FavController favController = Get.find<FavController>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Items'),
          centerTitle: true,
        ),
        body: Obx(() {
          return ListView.builder(
              itemCount: favController.favItems.length,
              itemBuilder: (context, index) {
                var product = favController.favItems[index];
                return ListTile(
                    title: Text(product.name),
                    subtitle: Text(product.price.toString()),
                    trailing: IconButton(
                        onPressed: () => favController.removeFromFav(product),
                        icon: const Icon(
                          Icons.remove_circle_outline,
                          color: Colors.red,
                        )));
              });
        }),
        bottomNavigationBar: Obx(() {
          return Container(
            margin: const EdgeInsets.all(20.0),
            child: Text(favController.itemCount.toString()),
          );
        }));
  }
}
