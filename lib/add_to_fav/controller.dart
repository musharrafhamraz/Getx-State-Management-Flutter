import 'package:get/get.dart';
import 'package:getxstatepractice/add_to_cart/product_model.dart';

class FavController extends GetxController {
  var favItems = <Product>[].obs;

  // add to fav

  void toggleFavItems(Product product) {
    product.isFav.value = !product.isFav.value;
    if (product.isFav.value) {
      favItems.add(product);
      Get.snackbar(
        product.name,
        'Added to favourite items.',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    } else {
      favItems.remove(product);
      Get.snackbar(
        product.name,
        'removed from favourite items.',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    }
  }

  void removeFromFav(Product product) {
    product.isFav.value = false;
    favItems.remove(product);
  }

  int get itemCount => favItems.length;
}
