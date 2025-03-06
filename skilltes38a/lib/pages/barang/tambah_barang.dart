import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:skilltes38a/widgets/widget.dart';

class TambahBarang extends StatefulWidget {
  const TambahBarang({super.key});

  @override
  State<TambahBarang> createState() => _TambahBarangState();
}

class _TambahBarangState extends State<TambahBarang> {
  final TextEditingController barangController = TextEditingController();
  final TextEditingController jenisController = TextEditingController();
  final TextEditingController stockController = TextEditingController();

  // Fungsi tambah data barang ke Firestore
  void tambahBarang() async {
    if (barangController.text.isEmpty ||
        jenisController.text.isEmpty ||
        stockController.text.isEmpty) {
      // Menampilkan pesan jika ada field yang kosong
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Harap isi semua field sebelum menyimpan!')),
      );
      return; // Hentikan eksekusi jika ada field yang kosong
    }

    try {
      await FirebaseFirestore.instance.collection('barang').add({
        'barang': barangController.text,
        'jenis': jenisController.text,
        'stock': stockController.text,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Barang Berhasil Ditambahkan')),
      );

      // Kembali ke halaman sebelumnya setelah data ditambahkan
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF315A8A),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: textView(EdgeInsets.all(0), 'Tambah Barang', TextAlign.left,
            Colors.white, FontWeight.w500, 15),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            inputView(barangController, 1, 'Barang', 'Masukkan Nama Barang!'),
            SizedBox(height: 20),
            inputView(
                jenisController, 1, 'Jenis Barang', 'Masukan Jenis Barang!'),
            SizedBox(height: 20),
            inputView(
                stockController, 1, 'Stock Barang', 'Masukkan Jumlah Stock!'),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: tambahBarang,
                child: textView(EdgeInsets.all(0), 'Tambah Barang',
                    TextAlign.center, Colors.white, FontWeight.w500, 16),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF315A8A),
                    padding:
                        EdgeInsets.symmetric(horizontal: 100, vertical: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
