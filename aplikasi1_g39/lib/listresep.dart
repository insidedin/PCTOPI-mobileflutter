import 'package:aplikasi1_g39/detail.dart';
import 'package:flutter/material.dart';

class ListResep extends StatefulWidget {
  const ListResep({super.key});

  @override
  State<ListResep> createState() => _ListResepState();
}

class _ListResepState extends State<ListResep> {
  final List<Map<String, String>> resep = [
    {
      'judul': 'Craby Patty Bikini Bottom',
      'gambar': 'assets/burger.png',
      'durasi': '10 menit',
      'bahan': 'Roti, Daging, Sayuran, Keju',
      'langkah-langkah':
          '1. Siapkan roti, daging, sayuran, dan keju\n2. Masak daging hingga matang\n3. Tata roti, daging, sayuran, dan keju\n4. Selesai'
    },
    {
      'judul': 'Cake Spongebob',
      'gambar': 'assets/cake.png',
      'durasi': '30 menit',
      'bahan': 'Tepung, Telur, Gula, Mentega',
      'langkah-langkah':
          '1. Siapkan tepung, telur, gula, mentega\n2. Kocok telur dan gula hingga mengembang\n3. Masukkan tepung dan mentega\n4. Panggang hingga matang\n5. Selesai'
    },
    {
      'judul': 'Kentang Goreng',
      'gambar': 'assets/kentang.png',
      'durasi': '5 menit',
      'bahan': 'Kentang, Minyak, Garam',
      'langkah-langkah':
          '1. Siapkan kentang, minyak, dan garam\n2. Goreng kentang hingga matang\n3. Selesai'
    },
    {
      'judul': 'Pasta Spaghetti',
      'gambar': 'assets/pasta.png',
      'durasi': '12 menit',
      'bahan': 'Pasta, Saus, Daging, Sayuran',
      'langkah-langkah':
          '1. Siapkan pasta, saus, daging, sayuran\n2. Masak pasta hingga matang\n3. Tumis daging dan sayuran\n4. Campurkan pasta dan tumisan\n5. Selesai'
    },
    {
      'judul': 'Pizza Krusty Krab',
      'gambar': 'assets/pizza.png',
      'durasi': '25 menit',
      'bahan': 'Roti, Saus, Keju, Daging, Sayuran',
      'langkah-langkah':
          '1. Siapkan roti, saus, keju, daging, sayuran\n2. Tata roti, saus, keju, daging, sayuran\n3. Panggang hingga matang\n4. Selesai'
    },
    {
      'judul': 'Ramen Naruto',
      'gambar': 'assets/ramen.png',
      'durasi': '12 menit',
      'bahan': 'Mie, Kuah, Daging, Sayuran',
      'langkah-langkah':
          '1. Siapkan mie, kuah, daging, sayuran\n2. Masak mie hingga matang\n3. Rebus kuah, daging, sayuran\n4. Campurkan mie dan kuah\n5. Selesai'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Buku Resep Mom'),
          backgroundColor: Colors.greenAccent,
        ),
        body: ListView.builder(
          itemCount: resep.length,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: ListTile(
                  leading: Image.asset(resep[index]['gambar']!),
                  title: Text(resep[index]['judul']!),
                  subtitle: Text(resep[index]['durasi']!),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Detail(
                            resep: resep[index],
                          ),
                        ));
                  }),
            );
          },
        ));
  }
}
