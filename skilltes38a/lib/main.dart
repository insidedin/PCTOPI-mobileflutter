import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:skilltes38a/pages/barang.dart';
import 'package:skilltes38a/pages/barang/edit_barang.dart';
import 'package:skilltes38a/pages/barang/tambah_barang.dart';
import 'package:skilltes38a/pages/home.dart';
import 'package:skilltes38a/pages/login.dart';
import 'package:skilltes38a/pages/pembelian/belipage.dart';
import 'package:skilltes38a/pages/pembelian/tambah_beli.dart';
import 'package:skilltes38a/pages/penjualan/jualpage.dart';
import 'package:skilltes38a/pages/penjualan/tambah_jual.dart';
import 'package:skilltes38a/pages/splashscreen.dart';
import 'package:skilltes38a/pages/penjualan.dart';
import 'package:skilltes38a/pages/suplier.dart';
import 'package:skilltes38a/pages/suplier/edit_suplier.dart';
import 'package:skilltes38a/pages/suplier/tambah_suplier.dart';
import 'package:skilltes38a/widgets/navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        '/': (context) => const Navigation(),
        '/login': (context) => const Login(),
        '/navigation': (context) => const Navigation(),
        '/home': (context) => const Home(),

        //route barang
        '/barang': (context) => const Barang(),
        '/tambahbarang': (context) => const TambahBarang(),
        '/editbarang':  (context) => const EditBarang(),

        //route penjualan
        '/penjualan': (context) => const Penjualan(),
        '/jualpage':  (context) => const JualPage(),
        '/tambahjual':  (context) => const TambahJual(),
        '/belipage':  (context) => const BeliPage(),
        '/tambahbeli':  (context) => const TambahBeli(),

        //route suplier
        '/suplier': (context) => const Suplier(),
        '/tambahsuplier': (context) => const TambahSuplier(),
        '/editsuplier':  (context) => const EditSuplier(),
      },
    );
  }
}
