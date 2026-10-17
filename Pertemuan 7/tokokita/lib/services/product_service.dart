import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/product.dart';

class ProductService {
  static const String baseUrl = 'https://fakestoreapi.com/products';

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      print('Status Code API: ${response.statusCode}');

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body);
        return jsonResponse.map((data) => Product.fromJson(data)).toList();
      } else {
        throw Exception(
          'Gagal memuat produk. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan saat mengambil data: $e');
    }
  }

  Future<Product> fetchProductDetail(String id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/$id'));
      if (response.statusCode == 200) {
        return Product.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(
          'Gagal memuat detail produk. Status: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan: $e');
    }
  }
}
