import 'package:flutter/material.dart';

class Etalase extends StatefulWidget {
  const Etalase({super.key});

  @override
  State<Etalase> createState() => _EtalaseState();
}

class _EtalaseState extends State<Etalase> {
  //definisi isi etalase
  final List<Map<String, String>> kursus = [
    {
      'gambar': 'assets/ms.jpg',
      'nama': 'Kursus Microsoft Office',
      'harga': 'Rp.600.000'
    },
    {
      'gambar': 'assets/desain.jpg',
      'nama': 'Kursus Desain Grafis',
      'harga': 'Rp.650.000'
    },
    {
      'gambar': 'assets/laravel.jpg',
      'nama': 'Kursus Framework Laravel',
      'harga': 'Rp.700.000'
    },
    {
      'gambar': 'assets/web.jpg',
      'nama': 'Kursus Desain Web',
      'harga': 'Rp.650.000'
    },
    {
      'gambar': 'assets/autocad.jpg',
      'nama': 'Kursus Autocad 3D',
      'harga': 'Rp.750.000'
    },
    {
      'gambar': 'assets/digital.jpg',
      'nama': 'Kursus Digital Marketing',
      'harga': 'Rp.550.000'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Product Course'),
        ),
        body: Padding(
            padding: EdgeInsets.all(16.0),
            child: GridView.count(
                crossAxisCount: 2,

                //memanggil list produk
                children: List.generate(kursus.length, (index) {
                  final item = kursus[index];

                  // tampilan card produk
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                          child: Image.asset(
                            item['gambar']!,
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5, bottom: 4),
                          child: Text(item['nama']!),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5, bottom: 4),
                          child: Text(
                            item['harga']!,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  );
                }))));
  }
}
