import 'package:get/get.dart';

class Product {
  final int id;
  final String name;
  final double price;
  RxBool isFav = false.obs;

  Product({
    required this.id,
    required this.name,
    required this.price,
  });
}
