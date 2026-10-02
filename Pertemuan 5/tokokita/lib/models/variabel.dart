void main() {
  const String namaToko = 'TokoKita';

  int stok = 50;
  double harga = 150000.0;
  String namaProduk = 'Kemeja Flanel';
  bool statusTersedia = true;

  var kategoriAktif = 'Fashion';

  final DateTime waktuInput = DateTime.now();

  print('--- Info Produk ---');
  print('Toko: $namaToko');
  print('Produk: $namaProduk | Kategori: $kategoriAktif');
  print('Harga: Rp$harga | Stok: $stok | Tersedia: $statusTersedia');
  print('Waktu Input: $waktuInput\n');

  List<String> daftarKategori = ['Elektronik', 'Fashion', 'Makanan'];
  Map<String, dynamic> produkMentah = {
    'nama': 'Laptop',
    'harga': 8500000.0,
    'kategori': daftarKategori[0],
  };

  print('Daftar Kategori: $daftarKategori');
  print('Data Map Produk: $produkMentah');
}
