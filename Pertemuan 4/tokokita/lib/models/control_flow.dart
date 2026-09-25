void main() {
  int stokBarang = 5;
  String statusProduk;

  if (stokBarang > 10) {
    statusProduk = 'Tersedia';
  } else if (stokBarang > 0) {
    statusProduk = 'Stok Terbatas';
  } else {
    statusProduk = 'Habis';
  }
  print('--- 1. Status Stok (If-Else) ---');
  print('Stok saat ini: $stokBarang -> Label: $statusProduk\n');

  List<double> hargaKeranjang = [150000.0, 75000.0, 25000.0];
  double totalBelanja = 0;

  for (int i = 0; i < hargaKeranjang.length; i++) {
    totalBelanja += hargaKeranjang[i];
  }
  print('--- 2. Total Belanja (For Loop) ---');
  print(
    'Total harga dari ${hargaKeranjang.length} barang adalah: Rp$totalBelanja\n',
  );

  int sisaStok = 3;
  print('--- 3. Pengurangan Stok (While Loop) ---');
  while (sisaStok > 0) {
    print('Proses checkout... Barang terjual 1. Sisa stok: ${sisaStok - 1}');
    sisaStok--;
  }
  print('Peringatan: Stok barang sudah habis!\n');

  String kategoriProduk = 'Fashion';
  int persenDiskon;

  switch (kategoriProduk) {
    case 'Elektronik':
      persenDiskon = 10;
      break;
    case 'Fashion':
      persenDiskon = 15;
      break;
    case 'Makanan':
      persenDiskon = 5;
      break;
    default:
      persenDiskon = 0;
  }
  print('--- 4. Diskon Kategori (Switch-Case) ---');
  print('Kategori $kategoriProduk mendapatkan diskon: $persenDiskon%');
}
