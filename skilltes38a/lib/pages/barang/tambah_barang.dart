import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:skilltes38a/widgets/widget.dart';
import 'package:google_fonts/google_fonts.dart';

class TambahBarang extends StatefulWidget {
  const TambahBarang({super.key});

  @override
  State<TambahBarang> createState() => _TambahBarangState();
}

class _TambahBarangState extends State<TambahBarang> {
  final TextEditingController barangController = TextEditingController();
  final TextEditingController jenisController = TextEditingController();
  final TextEditingController stockController = TextEditingController();

  String? selectedSuplier; // Suplier yang dipilih

  // Fungsi untuk mengambil daftar suplier dari Firestore
  Future<List<String>> getSupliers() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('suplier').get();

    List<String> supliers = snapshot.docs
        .map((doc) => doc['nama'].toString()) // Ambil nama suplier
        .toList();

    return supliers;
  }

  // Fungsi tambah data barang ke Firestore
  void tambahBarang() async {
    if (barangController.text.isEmpty ||
        jenisController.text.isEmpty ||
        stockController.text.isEmpty ||
        selectedSuplier == null) {
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
        'suplier': selectedSuplier, // Tambahkan suplier
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
            SizedBox(height: 20),

            // Dropdown Suplier
            FutureBuilder<List<String>>(
              future: getSupliers(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }

                List<String> supliers = snapshot.data!;
                return DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Pilih Suplier',
                    border: OutlineInputBorder(),
                    labelStyle: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 151, 151, 151),
                      fontSize: 14,
                    ),
                    fillColor: const Color.fromARGB(255, 232, 232, 232),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 151, 151, 151),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  value: selectedSuplier,
                  items: supliers.map((suplier) {
                    return DropdownMenuItem(
                      value: suplier,
                      child: textView(EdgeInsets.all(0), suplier,
                          TextAlign.left, Colors.black, FontWeight.w500, 16),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedSuplier = value;
                    });
                  },
                );
              },
            ),
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
