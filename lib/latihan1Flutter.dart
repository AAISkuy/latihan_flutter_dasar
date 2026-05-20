import 'package:flutter/material.dart';

class scaffold extends StatelessWidget {
  const scaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 7, 7),
        centerTitle: true,
        title: Text("Profil Saya",
           style: TextStyle(
              color: Colors.white),
         ),
      ),
      body: Center(
        child:Column(
          mainAxisAlignment:MainAxisAlignment.start,
            children: [
              Text("Nama : Ahmad Fizal Al Faris",
              style:TextStyle(
                fontWeight: FontWeight.bold,
              )),
              Text("📍 Jakarta"),
              Text("Peserta Pelatihan PPKD Jakarta Pusat Batch 2 tahun 2026")]
        )
      )
    );
  }
}