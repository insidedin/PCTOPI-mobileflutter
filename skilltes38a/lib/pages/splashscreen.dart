import 'dart:async';

import 'package:flutter/material.dart';
import 'package:skilltes38a/pages/login.dart';
import 'package:skilltes38a/widgets/widget.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF315A8A),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/dtracsi.png', width: 200, height: 200),
          ),
          textView(EdgeInsets.only(top: 30), 'TokoKu Ikhtiar', TextAlign.center,
              Colors.white, FontWeight.w500, 20.0)
        ],
      ),
    );
  }
}
