import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skilltes38a/pages/barang/edit_barang.dart';
import 'package:skilltes38a/widgets/widget.dart';

class Barang extends StatefulWidget {
  const Barang({super.key});

  @override
  State<Barang> createState() => _BarangState();
}

class _BarangState extends State<Barang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFE5E5E5),
        appBar: AppBar(
          backgroundColor: const Color(0xFF315A8A),
          automaticallyImplyLeading: false,
          title: textView(EdgeInsets.all(0), 'Data Barang', TextAlign.left,
              Colors.white, FontWeight.w500, 15),
          actions: [
            IconButton(
              icon: Icon(Icons.add_box_rounded, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, '/tambahbarang');
              },
            ),
          ],
        ),
        body: Column(
          children: [
            // StreamBuilder untuk menampilkan data dari Firestore
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('barang')
                    .orderBy('barang', descending: false)
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Center(
                        child: textView(
                            EdgeInsets.all(0),
                            "Belum ada Barang yang Tersedia",
                            TextAlign.center,
                            Colors.grey,
                            FontWeight.w500,
                            15));
                  }

                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var doc = snapshot.data!.docs[index];
                      var data = doc.data() as Map<String, dynamic>;

                      return ListTile(
                        contentPadding:
                            const EdgeInsets.only(left: 25.0, right: 10.0),
                        title: Text(
                          data['barang'] ?? 'Tanpa Barang',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          ),
                        ),
                        subtitle: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '${data['jenis'] ?? 'Tanpa Jenis'}\n',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  color: Colors.black, // Warna untuk jenis
                                ),
                              ),
                              TextSpan(
                                text: 'Stock: ${data['stock'] ?? '0'}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  color: Colors
                                      .blueGrey, // Warna berbeda untuk stock
                                ),
                              ),
                            ],
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize
                              .min, // Menghindari Row mengambil terlalu banyak ruang
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit_square,
                                  color: Colors.yellow[700]),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EditBarang(docId: doc.id),
                                  ),
                                );
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                FirebaseFirestore.instance
                                    .collection('barang')
                                    .doc(doc.id)
                                    .delete();
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ));
  }
}
