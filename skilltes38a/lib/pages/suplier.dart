import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skilltes38a/pages/suplier/edit_suplier.dart';
import 'package:skilltes38a/widgets/widget.dart';

class Suplier extends StatefulWidget {
  const Suplier({super.key});

  @override
  State<Suplier> createState() => _SuplierState();
}

class _SuplierState extends State<Suplier> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF315A8A),
        automaticallyImplyLeading: false,
        title: textView(EdgeInsets.all(0), 'Data Suplier', TextAlign.left,
            Colors.white, FontWeight.w500, 15),
        actions: [
          IconButton(
            icon: Icon(Icons.add_business_rounded, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/tambahsuplier');
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
                  .collection('suplier')
                  .orderBy('nama', descending: false)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(
                      child: textView(
                          EdgeInsets.all(0),
                          "Data Suplier tidak Tersedia",
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
                        data['nama'] ?? 'Tanpa Nama',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      ),
                      subtitle: Text(
                        data['kontak'] ?? 'Tanpa Kontak',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      ),
                      trailing: PopupMenuButton<String>(
                        constraints:
                            BoxConstraints(minWidth: 150), // Perbaiki ukuran
                        onSelected: (value) {
                          if (value == 'edit') {
                            Navigator.pushNamed(
                              context,
                              '/editSuplier',
                              arguments: doc.id, // Kirim ID dokumen
                            );
                          } else if (value == 'delete') {
                            FirebaseFirestore.instance
                                .collection('suplier')
                                .doc(doc.id)
                                .delete();
                          }
                        },
                        itemBuilder: (BuildContext context) => [
                          PopupMenuItem<String>(
                            value: 'edit',
                            child: ListTile(
                              leading: const Icon(Icons.edit_document),
                              title: Text("Edit"),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EditSuplier(docId: doc.id)),
                                );
                              },
                            ),
                          ),
                          PopupMenuItem<String>(
                            value: 'delete',
                            child: ListTile(
                              leading: const Icon(Icons.delete_forever_rounded),
                              title: Text("Hapus"),
                            ),
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
      ),
    );
  }
}
