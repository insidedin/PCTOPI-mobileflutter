import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final List<Map<String, String>> chat = [
    {
      'gambar': 'assets/burger.png',
      'nama': 'Burger King Delivery',
      'pesan': 'Halo inii pesanan anda',
      'waktu': '10.02',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('WhatsApp Chat'),
          backgroundColor: Colors.green[900],
        ),
        body: ListView.builder(
          itemCount: chat.length,
          itemBuilder: (context, index) {
            final pesan = chat[index];
            return ListTile(
              leading: ClipOval(
                  child: Image.asset(
                chat[index]['gambar']!,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              )),
              title: Text(chat[index]['nama']!,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              subtitle: Text(chat[index]['pesan']!),
              trailing: Text(chat[index]['waktu']!),
            );
          },
        ));
  }
}
