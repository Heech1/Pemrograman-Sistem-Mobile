import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/product_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Product> products = List.generate(15, (index) {
    if (index % 2 == 0) {
      return DiscountedProduct(
        id: 'P0${index + 1}',
        name: 'Laptop Axioo Pongo ${index + 1}',
        price: 15000000.0 + (index * 100000),
        category: 'Elektronik',
        stock: index % 4 == 0 ? 0 : 5,
        imageUrl: 'gambar.png',
        discountPercent: 10.0 + index,
      );
    } else {
      return Product(
        id: 'P0${index + 1}',
        name: 'Kemeja Flanel ${index + 1}',
        price: 150000.0 + (index * 5000),
        category: 'Fashion',
        stock: 10,
        imageUrl: 'gambar.png',
      );
    }
  });

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
                  const Icon(
                    Icons.shopping_cart,
                    size: 30,
                    color: Colors.blueAccent,
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(product: products[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
