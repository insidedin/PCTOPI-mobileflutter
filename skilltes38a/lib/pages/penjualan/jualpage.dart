import 'package:flutter/material.dart';
import 'package:skilltes38a/widgets/widget.dart';

class JualPage extends StatefulWidget {
  const JualPage({super.key});

  @override
  State<JualPage> createState() => _JualPageState();
}

class _JualPageState extends State<JualPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF315A8A),
        automaticallyImplyLeading: false,
        title: textView(EdgeInsets.all(0), 'Data Penjualan', TextAlign.left,
            Colors.white, FontWeight.w500, 15),
      ),
    );
  }
}
