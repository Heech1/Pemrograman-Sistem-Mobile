import 'package:flutter/material.dart';

import 'models/product.dart';
import 'widgets/product_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Product produkSatu = Product(
      id: 'P01',
      name: 'Axioo Pongo 750',
      price: 15000000,
      category: 'Elektronik',
      stock: 5,
      imageUrl: 'axioo.png',
      description: 'i7-12700H, RTX 4060',
    );

    Product produkDua = Product(
      id: 'P02',
      name: 'Kemeja Flanel',
      price: 150000,
      category: 'Fashion',
      stock: 20,
      imageUrl: 'flanel.png',
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TokoKita',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('TokoKita - Pertemuan 3'),
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
        ),

        body: ListView(
          children: [
            ProductCard(product: produkSatu),
            ProductCard(product: produkDua),
          ],
        ),
      ),
    );
  }
}
