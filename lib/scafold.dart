import 'package:flutter/material.dart';

class latihan1flutter extends StatelessWidget {
  const latihan1flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
         actions: [Text("Keluar")],
        centerTitle: true,

        title: Text("Profil Saya"),
      ),
      body: Text("Nama Saya"),    
      );
  }
}