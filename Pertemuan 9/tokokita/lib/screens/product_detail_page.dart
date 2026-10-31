import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/product.dart';
import '../widgets/custom_widgets.dart';
import '../controllers/cart_controller.dart';
import '../services/product_service.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int quantity = 1;
  final CartController cartController = Get.find<CartController>();
  final ProductService productService = ProductService();

  late Future<Product> futureProductDetail;

  @override
  void initState() {
    super.initState();
    
    final String productId = Get.arguments as String;
    futureProductDetail = productService.fetchProductDetail(productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
        backgroundColor: Colors.blueAccent,
      ),
      body: FutureBuilder<Product>(
        future: futureProductDetail,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Colors.blueAccent));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}', textAlign: TextAlign.center));
          } else if (snapshot.hasData) {
            final product = snapshot.data!;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(16)),
                      
                      child: Image.network(
                        product.imageUrl,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) => const Icon(Icons.image, size: 80, color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(product.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  PriceLabel(price: product.price),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      CategoryTag(category: product.category),
                      const SizedBox(width: 10),
                      StockBadge(stock: product.stock),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text('Deskripsi:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(product.description ?? 'Tidak ada deskripsi.'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline, size: 30),
                        onPressed: () {
                          if (quantity > 1) setState(() => quantity--);
                        },
                      ),
                      Text('$quantity', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline, size: 30),
                        onPressed: () => setState(() => quantity++),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                      onPressed: () {
                        for (int i = 0; i < quantity; i++) {
                          cartController.addToCart(product);
                        }
                        Get.back();
                        Get.snackbar('Berhasil', '$quantity item dimasukkan ke keranjang',
                            snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green, colorText: Colors.white, margin: const EdgeInsets.all(12));
                      },
                      child: const Text('Tambah ke Keranjang', style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}