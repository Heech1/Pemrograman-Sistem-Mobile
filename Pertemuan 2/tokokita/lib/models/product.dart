class Product {
  String id;
  String name;
  double price;
  String category;
  int stock;
  String imageUrl;
  String? description;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.stock,
    required this.imageUrl,
    this.description,
  });

  String getStatusStok() {
    if (stock > 10) return 'Tersedia Banyak';
    if (stock > 0) return 'Stok Terbatas';
    return 'Habis';
  }

  void cetakInfo() {
    print('Produk: $name | Kategori: $category');
    print(
      'Harga: Rp${price.toInt()} | Stok: $stock | Status: ${getStatusStok()}',
    );
    if (description != null) {
      print('Deskripsi: $description');
    } else {
      print('Deskripsi: - (Tidak ada deskripsi)');
    }
  }
}

class DiscountedProduct extends Product {
  double discountPercent;

  DiscountedProduct({
    required super.id,
    required super.name,
    required super.price,
    required super.category,
    required super.stock,
    required super.imageUrl,
    super.description,
    required this.discountPercent,
  });

  double hitungHargaFinal() {
    return price - (price * (discountPercent / 100));
  }

  @override
  void cetakInfo() {
    super.cetakInfo();
    print(
      'Diskon: $discountPercent% | Harga Final: Rp${hitungHargaFinal().toInt()}',
    );
  }
}

double hitungTotalBelanja(List<Product> keranjang) {
  double total = 0;
  for (var produk in keranjang) {
    if (produk is DiscountedProduct) {
      total += produk.hitungHargaFinal();
    } else {
      total += produk.price;
    }
  }
  return total;
}

void main() {
  List<Product> daftarProduk = [
    DiscountedProduct(
      id: 'P01',
      name: 'Axioo Pongo 750',
      price: 15000000,
      category: 'Elektronik',
      stock: 5,
      imageUrl: 'axioo.png',
      description: 'i7-12700H, RTX 4060',
      discountPercent: 10,
    ),
    Product(
      id: 'P02',
      name: 'Trigger L1R1 PUBG',
      price: 35000,
      category: 'Elektronik',
      stock: 15,
      imageUrl: 'trigger.png',
    ),
    Product(
      id: 'P03',
      name: 'Cooler HP',
      price: 120000,
      category: 'Elektronik',
      stock: 8,
      imageUrl: 'cooler.png',
    ),
    Product(
      id: 'P04',
      name: 'Kemeja Flanel',
      price: 150000,
      category: 'Fashion',
      stock: 20,
      imageUrl: 'flanel.png',
    ),
    DiscountedProduct(
      id: 'P05',
      name: 'Jaket Hoodie',
      price: 250000,
      category: 'Fashion',
      stock: 0,
      imageUrl: 'hoodie.png',
      discountPercent: 20,
    ),
    Product(
      id: 'P06',
      name: 'Sepatu Sneakers',
      price: 450000,
      category: 'Fashion',
      stock: 12,
      imageUrl: 'sepatu.png',
    ),
    Product(
      id: 'P07',
      name: 'Keripik Singkong',
      price: 15000,
      category: 'Makanan',
      stock: 50,
      imageUrl: 'keripik.png',
    ),
    Product(
      id: 'P08',
      name: 'Kopi Susu Literan',
      price: 85000,
      category: 'Makanan',
      stock: 5,
      imageUrl: 'kopi.png',
    ),
  ];

  print('--- Daftar Produk TokoKita ---');
  for (var produk in daftarProduk) {
    produk.cetakInfo();
    print('---------------------------');
  }

  print('\n--- Simulasi Keranjang Belanja ---');

  List<Product> keranjangBelanja = [
    daftarProduk[0],
    daftarProduk[1],
    daftarProduk[3],
  ];

  double total = hitungTotalBelanja(keranjangBelanja);
  print('Total belanja Anda: Rp${total.toInt()}');

  // Uji safety
  // daftarProduk[1].name = null;
}
