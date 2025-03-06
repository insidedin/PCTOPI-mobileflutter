import 'package:flutter/material.dart';
import 'package:skilltes38a/widgets/widget.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController UsernameController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80),
              Center(
                child: Image.asset(
                  'assets/images/dracsi-2.png',
                  height: 150,
                ),
              ),
              SizedBox(height: 40),
              Center(
                child: textView(
                    EdgeInsets.all(0),
                    'Selamat Datang di Aplikasi Stock Barang TokoKu Ikhtiar',
                    TextAlign.center,
                    Colors.black,
                    FontWeight.w500,
                    16),
              ),
              SizedBox(height: 15),
              inputController(
                  UsernameController, Icon(Icons.person), 'Username'),
              SizedBox(height: 25),
              inputController(PasswordController, Icon(Icons.lock), 'Password'),
              SizedBox(height: 30),
              //// tombol login
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/navigation');
                  },
                  child: textView(EdgeInsets.all(0), 'LOGIN', TextAlign.center,
                      Colors.white, FontWeight.w500, 16),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF315A8A),
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 20)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
