void main() {
  // 1. Variabel konstan (tidak bisa diubah)
  const String namaToko = 'TokoKita';

  // 2. Tipe data dasar
  int stok = 50;
  double harga = 150000.0;
  String namaProduk = 'Kemeja Flanel';
  bool statusTersedia = true;

  // 3. Inferensi tipe (var dan final)
  var kategoriAktif = 'Fashion';
  // final nilainya dikunci saat runtime, beda dengan const yang dikunci saat kompilasi
  final DateTime waktuInput = DateTime.now(); 

  print('--- Info Produk ---');
  print('Toko: $namaToko');
  print('Produk: $namaProduk | Kategori: $kategoriAktif');
  print('Harga: Rp$harga | Stok: $stok | Tersedia: $statusTersedia');
  print('Waktu Input: $waktuInput\n');

  // 4. List dan Map
  List<String> daftarKategori = ['Elektronik', 'Fashion', 'Makanan'];
  Map<String, dynamic> produkMentah = {
    'nama': 'Laptop',
    'harga': 8500000.0,
    'kategori': daftarKategori[0]
  };

  print('Daftar Kategori: $daftarKategori');
  print('Data Map Produk: $produkMentah');
}