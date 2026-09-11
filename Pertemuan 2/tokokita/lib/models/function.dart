double hitungHargaBiasa(double harga, double persenDiskon) {
  double nominalDiskon = harga * (persenDiskon / 100);
  return harga - nominalDiskon;
}

double hitungHargaSetelahDiskon({
  required double harga,
  double persenDiskon = 0,
}) {
  double nominalDiskon = harga * (persenDiskon / 100);
  return harga - nominalDiskon;
}

String formatRupiah(double harga) => 'Rp${harga.toInt()}';

void main() {
  double hargaAwal = 200000.0;

  print('Harga Asli: ${formatRupiah(hargaAwal)}\n');

  print('--- 1. Pemanggilan Function Biasa ---');
  double hasilBiasa = hitungHargaBiasa(hargaAwal, 10);
  print('Diskon 10%: ${formatRupiah(hasilBiasa)}');

  print('\n--- 2. Pemanggilan Function Named & Optional Parameter ---');

  double hasilNamed = hitungHargaSetelahDiskon(
    harga: hargaAwal,
    persenDiskon: 20,
  );
  print('Diskon 20%: ${formatRupiah(hasilNamed)}');

  double hasilDefault = hitungHargaSetelahDiskon(harga: hargaAwal);
  print('Tanpa input diskon (default 0%): ${formatRupiah(hasilDefault)}');

  print('\n--- 3. Penggunaan Arrow Function ---');
  print('Arrow function dipanggil di atas untuk merapikan cetakan harga.');
}
