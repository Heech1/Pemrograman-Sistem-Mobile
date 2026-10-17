import 'package:get/get.dart';

import '../models/product.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;

  void addToCart(Product product) {
    cartItems.add(product);
  }

  
  void removeFromCart(Product product) {
    cartItems.removeWhere((item) => item.id == product.id);
  }

  
  void removeOneItem(Product product) {
    final index = cartItems.indexWhere((item) => item.id == product.id);
    if (index != -1) {
      cartItems.removeAt(index);
    }
  }

  
  void clearCart() {
    cartItems.clear();
  }

  int get totalItem => cartItems.length;

  double get totalHarga {
    double total = 0;
    for (var item in cartItems) {
      total += item.price;
    }
    return total;
  }
}
