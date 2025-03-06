import 'package:flutter/material.dart';
import 'package:skilltes38a/widgets/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TambahSuplier extends StatefulWidget {
  const TambahSuplier({super.key});

  @override
  State<TambahSuplier> createState() => _TambahSuplierState();
}

class _TambahSuplierState extends State<TambahSuplier> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController kontakController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();

  // Fungsi tambah data suplier ke Firestore
  void tambahSuplier() async {
    if (namaController.text.isEmpty ||
        kontakController.text.isEmpty ||
        alamatController.text.isEmpty) {
      // Menampilkan pesan jika ada field yang kosong
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Harap isi semua field sebelum menyimpan!')),
      );
      return; // Hentikan eksekusi jika ada field yang kosong
    }

    try {
      await FirebaseFirestore.instance.collection('suplier').add({
        'nama': namaController.text,
        'kontak': kontakController.text,
        'alamat': alamatController.text,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Data Suplier Berhasil Ditambahkan')),
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
        title: textView(EdgeInsets.all(0), 'Tambah Suplier',
            TextAlign.left, Colors.white, FontWeight.w500, 15),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            inputView(
                namaController, 1, 'Nama Suplier', 'Masukkan Nama Suplier!'),
            SizedBox(height: 20),
            inputView(kontakController, 1, 'Kontak Suplier',
                'Masukan Kontak Suplier!'),
            SizedBox(height: 20),
            inputView(alamatController, 5, 'Alamat Suplier',
                'Masukkan Alamat Suplier!'),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: tambahSuplier,
                child: textView(EdgeInsets.all(0), 'Tambah Suplier',
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
