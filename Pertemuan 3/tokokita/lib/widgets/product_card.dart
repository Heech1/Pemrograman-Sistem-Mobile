import 'package:flutter/material.dart';

import '../models/product.dart';
import 'custom_widgets.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    print('Lifecycle: initState() dipanggil untuk ${widget.product.name}');
  }

  @override
  Widget build(BuildContext context) {
    print('Lifecycle: build() dipanggil untuk ${widget.product.name}');

    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.image, size: 80, color: Colors.grey),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.product.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                      print(
                        'setState() dipanggil: isFavorite berubah menjadi $isFavorite',
                      );
                    });
                  },
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PriceLabel(price: widget.product.price),
                StockBadge(stock: widget.product.stock),
              ],
            ),

            CategoryTag(category: widget.product.category),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    print('Lifecycle: dispose() dipanggil untuk ${widget.product.name}');
    super.dispose();
  }
}
