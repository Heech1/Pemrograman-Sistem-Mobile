void main() {
  // Data simulasi
  int stokKemeja = 50;
  int stokKaos = 5;
  double hargaKemeja = 150000.0;
  double hargaKaos = 75000.0;
  int jumlahBeli = 3;

  print('--- 1. Operator Aritmatika ---');
  double totalHarga = hargaKemeja * jumlahBeli;
  int sisaStok = stokKemeja - jumlahBeli;
  print('Beli $jumlahBeli Kemeja totalnya: Rp$totalHarga');
  print('Sisa stok kemeja sekarang: $sisaStok');

  print('\n--- 2. Operator Perbandingan ---');
  bool lebihMahal = hargaKemeja > hargaKaos;
  bool kemejaLebihBanyak = stokKemeja >= stokKaos;
  print('Apakah kemeja lebih mahal dari kaos? $lebihMahal');
  print('Apakah stok kemeja lebih banyak/sama dengan kaos? $kemejaLebihBanyak');

  print('\n--- 3. Operator Logika ---');
  // Syarat tampil: stok harus lebih dari 0 DAN harga harus lebih dari 0
  bool layakTampilKemeja = (stokKemeja > 0) && (hargaKemeja > 0);
  // Syarat restock: stok kurang dari 10 ATAU stok sama dengan 0
  bool butuhRestockKaos = (stokKaos < 10) || (stokKaos == 0);
  
  print('Apakah kemeja layak tampil di etalase? $layakTampilKemeja');
  print('Apakah kaos butuh restock segera? $butuhRestockKaos');
}