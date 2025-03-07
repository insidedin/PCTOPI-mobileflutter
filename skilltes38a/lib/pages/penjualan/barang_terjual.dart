import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:skilltes38a/widgets/widget.dart';

class TambahBarangTerjual extends StatefulWidget {
  const TambahBarangTerjual({super.key});

  @override
  State<TambahBarangTerjual> createState() => _TambahBarangTerjualState();
}

class _TambahBarangTerjualState extends State<TambahBarangTerjual> {
  String? selectedBarang;
  final TextEditingController jumlahController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  Future<List<String>> getBarangList() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('barang').get();
    return snapshot.docs.map((doc) => doc['barang'].toString()).toList();
  }

  void tambahBarangTerjual() async {
    if (selectedBarang == null || jumlahController.text.isEmpty || hargaController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Harap isi semua field sebelum menyimpan!')),
      );
      return;
    }

    try {
      int jumlah = int.parse(jumlahController.text);
      int harga = int.parse(hargaController.text);
      int totalHarga = jumlah * harga;

      await FirebaseFirestore.instance.collection('barang_terjual').add({
        'barang': selectedBarang,
        'jumlah': jumlah,
        'harga_satuan': harga,
        'total_harga': totalHarga,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Barang Terjual Berhasil Ditambahkan')),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan: $e')),
      );
    }
  }

  InputDecoration inputDecoration(String labelText) {
    return InputDecoration(
      labelText: labelText,
      border: OutlineInputBorder(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF315A8A),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: textView(EdgeInsets.all(0), 'Tambah Barang Terjual', TextAlign.left,
            Colors.white, FontWeight.w500, 15),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            FutureBuilder<List<String>>(
              future: getBarangList(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();
                return DropdownButtonFormField<String>(
                  decoration: InputDecoration(
      labelText: "Pilih Barang",
      border: OutlineInputBorder(),
    ),
                  value: selectedBarang,
                  items: snapshot.data!.map((barang) {
                    return DropdownMenuItem(value: barang, child: Text(barang));
                  }).toList(),
                  onChanged: (value) => setState(() => selectedBarang = value),
                );
              },
            ),
            SizedBox(height: 20),
            inputView(jumlahController, 1, 'Jumlah', 'Masukkan jumlah barang!'),
            SizedBox(height: 20),
            inputView(hargaController, 1, 'Harga Satuan', 'Masukkan harga per barang!'),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: tambahBarangTerjual,
                child: textView(EdgeInsets.all(0), 'Tambah Transaksi',
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
