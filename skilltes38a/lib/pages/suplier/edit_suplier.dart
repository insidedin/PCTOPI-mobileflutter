import 'package:flutter/material.dart';
import 'package:skilltes38a/widgets/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditSuplier extends StatefulWidget {
  final String docId;
  const EditSuplier({super.key, required this.docId});

  @override
  State<EditSuplier> createState() => _EditSuplierState();
}

class _EditSuplierState extends State<EditSuplier> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController kontakController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSuplierData();
  }

  // Fungsi untuk mengambil data suplier dari Firestore
  void _loadSuplierData() async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('suplier')
          .doc(widget.docId)
          .get();

      if (doc.exists) {
        setState(() {
          namaController.text = doc['nama'] ?? '';
          kontakController.text = doc['kontak'] ?? '';
          alamatController.text = doc['alamat'] ?? '';
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal mengambil data suplier: $e')),
      );
    }
  }

  // Fungsi untuk menyimpan perubahan
  void simpanPerubahan() async {
    if (namaController.text.isEmpty ||
        kontakController.text.isEmpty ||
        alamatController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Harap isi semua field sebelum menyimpan!')),
      );
      return;
    }

    try {
      await FirebaseFirestore.instance
          .collection('suplier')
          .doc(widget.docId)
          .update({
        'nama': namaController.text,
        'kontak': kontakController.text,
        'alamat': alamatController.text,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Data Suplier Berhasil Diperbarui')),
      );

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
        title: textView(EdgeInsets.all(0), 'Edit Suplier', TextAlign.left,
            Colors.white, FontWeight.w500, 15),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            inputView(
                namaController, 1, 'Nama Suplier', 'Masukkan Nama Suplier!'),
            SizedBox(height: 20),
            inputView(kontakController, 1, 'Kontak Suplier',
                'Masukkan Kontak Suplier!'),
            SizedBox(height: 20),
            inputView(alamatController, 5, 'Alamat Suplier',
                'Masukkan Alamat Suplier!'),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: simpanPerubahan,
                child: textView(EdgeInsets.all(0), 'Simpan Perubahan',
                    TextAlign.center, Colors.white, FontWeight.w500, 16),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF315A8A),
                    padding:
                        EdgeInsets.symmetric(horizontal: 80, vertical: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
