import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/wishlist_controller.dart';
import '../services/product_service.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlistC = Get.find<WishlistController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Wishlist Saya',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),

      body: FutureBuilder<List<Product>>(
        future: ProductService().fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Gagal memuat produk'));
          }

          final allProducts = snapshot.data ?? [];

          return Obx(() {
            final wishlistProducts = allProducts
                .where((p) => wishlistC.favoriteIds.contains(p.id.toString()))
                .toList();

            if (wishlistProducts.isEmpty) {
              return const Center(child: Text('Wishlist masih kosong nih bro'));
            }

            return ListView.builder(
              itemCount: wishlistProducts.length,
              itemBuilder: (context, index) {
                return ProductCard(product: wishlistProducts[index]);
              },
            );
          });
        },
      ),
    );
  }
}
