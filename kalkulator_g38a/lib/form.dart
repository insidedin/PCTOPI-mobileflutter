import 'package:flutter/material.dart';

class FormRegis extends StatefulWidget {
  const FormRegis({super.key});

  @override
  State<FormRegis> createState() => _FormRegisState();
}

class _FormRegisState extends State<FormRegis> {
  final TextEditingController nohpController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  bool isSiswa = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purpleAccent,
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Form Registrasi',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(labelText: 'Nomor Handphone'),
                controller: nohpController,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(labelText: 'Nama'),
                controller: namaController,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text('Apakah Anda Siswa?'),
                  Switch(
                      value: isSiswa,
                      onChanged: (value) {
                        setState(() {
                          isSiswa = value;
                        });
                      })
                ],
              ),
              SizedBox(height: 30),
              Center(
                child: InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text('Berhasil Submit'),
                                content: Text(
                                    'Nomor Handphone: ${nohpController.text}\n Nama: ${namaController.text}\n Siswa: ${isSiswa ? 'Ya' : 'Tidak'}'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('OK'),
                                  )
                                ],
                              ));
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.purpleAccent,
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              )
            ],
          ),
        ));
  }
}
