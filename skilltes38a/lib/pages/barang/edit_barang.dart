import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skilltes38a/widgets/widget.dart';

class EditBarang extends StatefulWidget {
  final String docId; // ID dokumen barang yang akan diedit

  const EditBarang({super.key, required this.docId});

  @override
  State<EditBarang> createState() => _EditBarangState();
}

class _EditBarangState extends State<EditBarang> {
  final TextEditingController barangController = TextEditingController();
  final TextEditingController jenisController = TextEditingController();
  final TextEditingController stockController = TextEditingController();

  String? selectedSuplier; // Menyimpan suplier yang dipilih
  List<String> supliers = []; // List suplier dari Firestore

  @override
  void initState() {
    super.initState();
    fetchBarangData(); // Ambil data barang berdasarkan docId
    fetchSupliers(); // Ambil daftar suplier
  }

  // Fungsi untuk mengambil data barang berdasarkan docId
  void fetchBarangData() async {
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('barang')
        .doc(widget.docId)
        .get();

    if (doc.exists) {
      setState(() {
        barangController.text = doc['barang'];
        jenisController.text = doc['jenis'];
        stockController.text = doc['stock'].toString();
        selectedSuplier = doc['suplier'];
      });
    }
  }

  // Fungsi untuk mengambil daftar suplier dari Firestore
  void fetchSupliers() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('suplier').get();

    setState(() {
      supliers = snapshot.docs.map((doc) => doc['nama'].toString()).toList();
    });
  }

  // Fungsi untuk menyimpan perubahan ke Firestore
  void updateBarang() async {
    if (barangController.text.isEmpty ||
        jenisController.text.isEmpty ||
        stockController.text.isEmpty ||
        selectedSuplier == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Harap isi semua field sebelum menyimpan!')),
      );
      return;
    }

    try {
      await FirebaseFirestore.instance
          .collection('barang')
          .doc(widget.docId)
          .update({
        'barang': barangController.text,
        'jenis': jenisController.text,
        'stock': stockController.text,
        'suplier': selectedSuplier,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Barang Berhasil Diperbarui')),
      );

      Navigator.pop(context); // Kembali ke halaman sebelumnya
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
        title: textView(EdgeInsets.all(0), 'Edit Barang', TextAlign.left,
            Colors.white, FontWeight.w500, 15),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            inputView(barangController, 1, 'Barang', 'Masukkan Nama Barang!'),
            SizedBox(height: 20),
            inputView(
                jenisController, 1, 'Jenis Barang', 'Masukkan Jenis Barang!'),
            SizedBox(height: 20),
            inputView(
                stockController, 1, 'Stock Barang', 'Masukkan Jumlah Stock!'),
            SizedBox(height: 20),

            // Dropdown Pilih Suplier
            DropdownButtonFormField<String>(
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
            ),
            SizedBox(height: 40),

            Center(
              child: ElevatedButton(
                onPressed: updateBarang,
                child: textView(EdgeInsets.all(0), 'Simpan Perubahan',
                    TextAlign.center, Colors.white, FontWeight.w500, 16),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF315A8A),
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
