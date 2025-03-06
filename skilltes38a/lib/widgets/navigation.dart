import 'package:flutter/material.dart';
import 'package:skilltes38a/pages/barang.dart';
import 'package:skilltes38a/pages/home.dart';
import 'package:skilltes38a/pages/penjualan.dart';
import 'package:skilltes38a/pages/suplier.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  //definisi halaman
  final List<Widget> page = [Home(), Barang(), Penjualan(), Suplier()];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: Color(0xFF315A8A),
        unselectedItemColor: Color(0xFFB1B1B1),
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.shifting,
        //list icon navigasi
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Dashboard'),
          BottomNavigationBarItem(
              icon: Icon(Icons.all_inbox_rounded), label: 'Barang'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopify_rounded), label: 'Penjulan'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_business_rounded), label: 'Suplier'),
        ],
      ),
    );
  }
}
