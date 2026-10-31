import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/product.dart';
import '../widgets/product_card.dart';
import '../controllers/cart_controller.dart';
import '../services/product_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CartController cartController = Get.find<CartController>();
  final ProductService productService = ProductService();

  late Future<List<Product>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = productService.fetchProducts();
  }

  void refreshData() {
    setState(() {
      futureProducts = productService.fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'TokoKita',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      Text(
                        'Belanja jadi lebih mudah',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                  Obx(
                    () => Badge(
                      label: Text(cartController.totalItem.toString()),
                      isLabelVisible: cartController.totalItem > 0,
                      child: const Icon(
                        Icons.shopping_cart,
                        size: 30,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Product>>(
                future: futureProducts,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.blueAccent,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.wifi_off,
                            size: 80,
                            color: Colors.redAccent,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Gagal memuat produk, coba lagi',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              '${snapshot.error}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: refreshData,
                            icon: const Icon(
                              Icons.refresh,
                              color: Colors.white,
                            ),
                            label: const Text(
                              'Coba Lagi',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasData) {
                    final products = snapshot.data!;
                    
                    return RefreshIndicator(
                      color: Colors.blueAccent,
                      onRefresh: () async {
                        refreshData();
                      },
                      child: ListView.builder(
                        padding: const EdgeInsets.all(12),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              
                              Get.toNamed(
                                '/detail',
                                arguments: products[index].id,
                              );
                            },
                            child: ProductCard(product: products[index]),
                          );
                        },
                      ),
                    );
                  }
                  return const Center(
                    child: Text('Tidak ada produk tersedia.'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
