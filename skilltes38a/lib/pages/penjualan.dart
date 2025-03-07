import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:skilltes38a/widgets/widget.dart';

class Penjualan extends StatefulWidget {
  const Penjualan({super.key});

  @override
  State<Penjualan> createState() => _PenjualanState();
}

class _PenjualanState extends State<Penjualan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF315A8A),
        automaticallyImplyLeading: false,
        title: textView(EdgeInsets.all(0), 'Data Penjualan Barang',
            TextAlign.left, Colors.white, FontWeight.w500, 15),
        actions: [
          IconButton(
            icon: Icon(Icons.add_shopping_cart, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/barangterjual');
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('barang_terjual').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("Belum ada data penjualan."));
          }

          return ListView.builder(
            padding: EdgeInsets.all(16.0),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var doc = snapshot.data!.docs[index];
              return Card(
                margin: EdgeInsets.only(bottom: 10),
                child: ListTile(
                  title: Text(doc['barang'],
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  subtitle: Text(
                      "Jumlah: ${doc['jumlah']} | Harga: Rp ${doc['harga_satuan']} | Total: Rp ${doc['total_harga']}",
                      style: TextStyle(fontSize: 14)),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      FirebaseFirestore.instance
                          .collection('barang_terjual')
                          .doc(doc.id)
                          .delete();
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
