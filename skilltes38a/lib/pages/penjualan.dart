import 'package:flutter/material.dart';
import 'package:skilltes38a/widgets/widget.dart';

class Penjualan extends StatefulWidget {
  const Penjualan({super.key});

  @override
  State<Penjualan> createState() => _PenjualanState();
}

class _PenjualanState extends State<Penjualan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF315A8A),
        automaticallyImplyLeading: false,
        title: textView(EdgeInsets.all(0), 'Data Penjualan Barang',
            TextAlign.left, Colors.white, FontWeight.w500, 15),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 20, // Jarak antar baris
            crossAxisSpacing: 20, // Jarak antar kolom
            shrinkWrap: true, // Menyesuaikan ukuran dengan konten
            physics:
                const NeverScrollableScrollPhysics(), // Menghindari scroll ganda
            children: [
              pengaturanJual(
                const Icon(
                  Icons.people,
                  size: 70,
                  color: Color.fromARGB(255, 18, 52, 92),
                ),
                'Penjualan',
                () {
                  Navigator.pushNamed(context, '/tambahbeli');
                },
              ),
              pengaturanJual(
                const Icon(
                  Icons.school_rounded,
                  size: 70,
                  color: Color.fromARGB(255, 18, 52, 92),
                ),
                'Pembelian',
                () {
                  Navigator.pushNamed(context, ' /tambahjual');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
