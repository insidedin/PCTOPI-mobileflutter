# skilltes38a

Aplikasi Pendataan Stock dan Barang Terjual 

Pages:
1. Splashscreen
2. Login
3. Home (Dashboard)
4. Barang
5. Penjualan
6. Suplier

Proses:
- CRUD Suplier > collection suplier : nama, kontak, alamat 
- CRUD Barang > collection barang : barang, jenis, stock, suplier(diambil dari collection nama suplier)
- CRUD Penjualan > collection barang_terjual : barang(diambil dari collection barang), jumlah_terjual, harga_satuan, dan total_harga
- Dashboard > akumulasi total data dari collection suplier, barang, dan barang_terjual

Langkah Pengerjaan:
1. Pastikan project sudah terhubung dengan firebase (lihat pada pendefinisian awal di file main.dart dan depedencies pada pubspec.yaml)
2. Lihat dan ikuti struktur folder yang tersedia pada folder lib (jika terdapat folder atau fle yang belum ada silahkan dibuat)
3. Silahkan pindahkan kode dari github ke project masing-masing yang ada di vscode dan sesuaikan lagi
4. Jika sudah jalankan project tersebut dan lakukan recording untuk demonstrasi (Deadline pegumpulan pada hari Senin 10 Maret 2025)
5. Yang dikumpulkan yaitu hasil recording demo aplikasi dan screenshot database firebase
