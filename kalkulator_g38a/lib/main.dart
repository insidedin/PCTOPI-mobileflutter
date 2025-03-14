import 'package:flutter/material.dart';
import 'package:praktik1_app/beranda.dart';
import 'package:praktik1_app/form.dart';
import 'package:praktik1_app/kalku.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context) => Beranda(),
        '/formregis':(context) => FormRegis(),
        '/kalkulator':(context) => Kalkulator(),
      }
    );
  }
}

