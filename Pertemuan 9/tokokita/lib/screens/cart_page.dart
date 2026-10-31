import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import '../widgets/custom_widgets.dart';
import 'checkout_page.dart'; 

class CartPage extends StatelessWidget {
  CartPage({super.key});

  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang Belanja'),
        backgroundColor: Colors.blueAccent,
        actions: [
          
          IconButton(
            icon: const Icon(Icons.delete_sweep, color: Colors.white),
            tooltip: 'Kosongkan Keranjang',
            onPressed: () {
              if (cartController.cartItems.isNotEmpty) {
                Get.defaultDialog(
                  title: "Konfirmasi",
                  middleText: "Yakin ingin mengosongkan semua barang di keranjang?",
                  textConfirm: "Ya, Kosongkan",
                  textCancel: "Batal",
                  confirmTextColor: Colors.white,
                  buttonColor: Colors.red,
                  cancelTextColor: Colors.blueAccent,
                  onConfirm: () {
                    cartController.clearCart();
                    Get.back(); 
                    Get.snackbar('Berhasil', 'Keranjang telah dikosongkan', backgroundColor: Colors.red, colorText: Colors.white);
                  },
                );
              }
            },
          )
        ],
      ),
      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return const Center(child: Text('Keranjang masih kosong nih,\nyuk belanja dulu!', textAlign: TextAlign.center, style: TextStyle(fontSize: 18)));
        }

        var uniqueProducts = cartController.cartItems.toSet().toList();

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: uniqueProducts.length,
                itemBuilder: (context, index) {
                  final product = uniqueProducts[index];
                  int quantity = cartController.cartItems.where((item) => item.id == product.id).length;

                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(width: 50, height: 50, color: Colors.grey[200], child: const Icon(Icons.image, color: Colors.grey)),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(product.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.bold)),
                                const SizedBox(height: 4),
                                PriceLabel(price: product.price),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(icon: const Icon(Icons.remove_circle_outline, color: Colors.red), onPressed: () => cartController.removeOneItem(product)),
                              Text('$quantity', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              IconButton(icon: const Icon(Icons.add_circle_outline, color: Colors.green), onPressed: () => cartController.addToCart(product)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, -5))]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Total:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                      Text('Rp${cartController.totalHarga.toInt()}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green)),
                    ],
                  ),
                  
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                    onPressed: () {
                      Get.off(() => CheckoutPage());
                    },
                    child: const Text('Checkout', style: TextStyle(color: Colors.white, fontSize: 16)),
                  )
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}