import 'package:flutter/material.dart';

class Kalkulator extends StatefulWidget {
  const Kalkulator({super.key});

  @override
  State<Kalkulator> createState() => _KalkulatorState();
}

class _KalkulatorState extends State<Kalkulator> {
  final TextEditingController nomor1Controller = TextEditingController();
  final TextEditingController nomor2Controller = TextEditingController();
  String hasil = '';

  void hitung(String operation) {
    final no1 = int.tryParse(nomor1Controller.text) ?? 0;
    final no2 = int.tryParse(nomor2Controller.text) ?? 0;
    setState(() {
      switch (operation) {
        case '+':
          hasil = (no1 + no2).toString();
          break;
        case '-':
          hasil = (no1 - no2).toString();
          break;
        case '*':
          hasil = (no1 * no2).toString();
          break;
        case '/':
          hasil = no2 != 0 ? (no1 / no2).toString(): 'Error';
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Kalkulator'),
          backgroundColor: Colors.tealAccent,
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Angka Pertama'),
                      controller: nomor1Controller,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Angka Kedua'),
                      controller: nomor2Controller,
                      keyboardType: TextInputType.number,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Text('Hasil : $hasil', style: TextStyle(fontSize: 30)),
              SizedBox(height: 16),
              Wrap (
                spacing: 5,
                children: ['+', '-', '*','/']
                .map(
                  (op) => InkWell(
                    onTap : () => hitung(op),
                    child: Container(
                      padding : EdgeInsets.all(10),
                      color: Colors.blue,
                      child: Text(op, style: TextStyle(color: Colors.white, fontSize: 20)
                    ),
                  )
                ),
              ).toList()
          )],
          ),
        ));
  }
}
