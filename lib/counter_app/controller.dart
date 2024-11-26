import 'package:get/get.dart';

class CountCtroller extends GetxController {
  var count = 0.obs;

  increment() => count++;
}
