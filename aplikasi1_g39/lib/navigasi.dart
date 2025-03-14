import 'package:aplikasi1_g39/chat.dart';
import 'package:aplikasi1_g39/listresep.dart';
import 'package:aplikasi1_g39/main.dart';
import 'package:flutter/material.dart';

class Navigasi extends StatefulWidget {
  const Navigasi({super.key});

  @override
  State<Navigasi> createState() => _NavigasiState();
}

class _NavigasiState extends State<Navigasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Beranda()));
                },
                child: Text('Biodata Saya')),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ListResep()));
                },
                child: Text('Buku Resep')),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Chat()));
                },
                child: Text('Chatting')),
          ],
        ),
      ),
    );
  }
}
