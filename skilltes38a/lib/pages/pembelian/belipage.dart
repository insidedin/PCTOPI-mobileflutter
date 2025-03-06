import 'package:flutter/material.dart';
import 'package:skilltes38a/widgets/widget.dart';

class BeliPage extends StatefulWidget {
  const BeliPage({super.key});

  @override
  State<BeliPage> createState() => _BeliPageState();
}

class _BeliPageState extends State<BeliPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF315A8A),
        automaticallyImplyLeading: false,
        title: textView(EdgeInsets.all(0), 'Data Pembelian', TextAlign.left,
            Colors.white, FontWeight.w500, 15),
      ),
    );
  }
}
