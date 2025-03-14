import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final Map<String, String> resep;

  const Detail({super.key, required this.resep});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Resep'),
        backgroundColor: const Color.fromARGB(255, 133, 183, 207),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.resep['judul']!,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Image.asset(
                  widget.resep['gambar']!,
                  height: 500,
                  width: 500,
                ),
                SizedBox(height: 15),
                Text('Durasi'),
                Text('${widget.resep['durasi']!}'),
                SizedBox(height: 20),
                Text('Bahan'),
                Text('${widget.resep['bahan']!}'),
                SizedBox(height: 20),
                Text('Langkah-langkah'),
                Text('${widget.resep['langkah-langkah']!}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
