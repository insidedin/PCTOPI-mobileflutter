import 'package:aplikasi1_g39/navigasi.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Navigasi());
  }
}

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Beranda'),
          backgroundColor: const Color.fromARGB(255, 133, 183, 207),
        ),
        body: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Biodata Saya',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(height: 15),
                Text('Nama Lengkap:'),
                Text('Andini Rahmatillah',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              ],
            )));
  }
}
