import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

inputController(controller, icon, label1) {
  return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: icon,
        hintText: label1,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF315A8A),
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF315A8A),
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ));
}

textView(margin, text, posisi, fontColor, tebal, ukuran) {
  return Container(
    margin: margin,
    child: Text(
      text,
      textAlign: posisi,
      style: GoogleFonts.poppins(
        color: fontColor,
        fontWeight: tebal,
        fontSize: ukuran,
      ),
    ),
  );
}

dashboardView(title, icon, Stream<int> countStream) {
  return Card(
    elevation: 5,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Color(0xFF315A8A)),
          SizedBox(height: 10),
          textView(EdgeInsets.all(0), title, TextAlign.left, Colors.black,
              FontWeight.w500, 16),
          StreamBuilder<int>(
            stream: countStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(); // Loading indicator
              }
              if (snapshot.hasError) {
                return Text('Error'); // Handle error
              }
              return textView(EdgeInsets.all(0), '${snapshot.data}',
                  TextAlign.left, Colors.black, FontWeight.bold, 20);
            },
          ),
        ],
      ),
    ),
  );
}

//inputan CRUD
inputView(controller, tinggi, label, eror) {
  return TextFormField(
    controller: controller,
    textInputAction: TextInputAction.next,
    textAlign: TextAlign.left,
    style: GoogleFonts.poppins(
      color: Colors.black,
      fontSize: 15,
    ),
    maxLines: tinggi,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: GoogleFonts.poppins(
        color: const Color.fromARGB(255, 151, 151, 151),
        fontSize: 14,
      ),
      fillColor: const Color.fromARGB(255, 232, 232, 232),
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color.fromARGB(255, 151, 151, 151),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return eror;
      }
      return null;
    },
  );
}

//button penjualan
pengaturanJual(icon, pengguna, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 160,
      height: 160,
      decoration: ShapeDecoration(
        color: const Color.fromARGB(255, 235, 235, 235),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(height: 8),
          Text(
            pengguna,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF315A8A),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}
