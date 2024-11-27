import 'package:get/get.dart';
import 'package:getxstatepractice/add_to_cart/product_model.dart';

class CartController extends GetxController {
  // cart products
  var cartProducts = <Product>[].obs;

  // function to add to cart

  void addToCart(Product product) {
    if (cartProducts.contains(product)) {
      Get.snackbar(
        'Already in Cart',
        '${product.name} is already in cart.',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    } else {
      cartProducts.add(product);
      Get.snackbar(
        'Added to Cart',
        '${product.name} has been added!',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    }
  }

  // remove from cart

  void removeFromCart(Product product) {
    cartProducts.remove(product);
  }

  // get the sum of price

  double get totalPrice =>
      cartProducts.fold(0, (sum, item) => sum + item.price);

  // count items in cart

  int get itemCount => cartProducts.length;
}
