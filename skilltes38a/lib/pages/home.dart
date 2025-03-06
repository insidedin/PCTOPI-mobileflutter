import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:skilltes38a/widgets/widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Fungsi untuk mengambil jumlah dokumen dalam koleksi Firestore
  Stream<int> getDataCount(String collection) {
    return FirebaseFirestore.instance.collection(collection).snapshots().map(
          (snapshot) => snapshot.size, // Hitung jumlah dokumen
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              //konten header
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.all(30),
                      child: textView(
                        EdgeInsets.all(0),
                        'Selamat Pagii, \nAdmin TokoKu Ikhtiar',
                        TextAlign.left,
                        Colors.black,
                        FontWeight.w500,
                        16,
                      )),
                  Spacer(), // Mengisi ruang kosong
                  Container(
                    margin: EdgeInsets.only(right: 30),
                    child: IconButton(
                      icon: Icon(Icons.logout_rounded),
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                    ),
                  )
                ],
              ),

              //konten dahsboard
              Padding(
                padding: EdgeInsets.all(20),
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true, // Menyesuaikan ukuran dengan konten
                  physics:
                      NeverScrollableScrollPhysics(), // Menghindari konflik dengan SingleChildScrollView
                  children: [
                    dashboardView('Data Barang', Icons.shopping_cart,
                        getDataCount('barang')),
                    dashboardView('Data Penjualan', Icons.shopping_bag,
                        getDataCount('penjualan')),
                    dashboardView('Data Pembelian', Icons.shopping_basket,
                        getDataCount('pembelian')),
                    dashboardView(
                        'Data Suplier', Icons.people, getDataCount('suplier')),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
