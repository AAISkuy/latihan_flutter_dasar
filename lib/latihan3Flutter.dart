import 'package:flutter/material.dart';

class registrasiCatalogCare extends StatelessWidget {
  const registrasiCatalogCare({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 50, 250, 233),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "CareSkin+",
              style: TextStyle(
                color: Color(0xFFEECBAF),
                fontSize: 24,
              ),
            ),
            Text(
              "Registrasi dan Katalog",
              style: TextStyle(
                color: Color(0xFFF0A8D6),
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 15,
          children: [
                  SizedBox(height: 8),
            Text("Nama"),
            TextField(
              decoration: InputDecoration(
                hintText: "Masukkan Nama Anda",
                filled: true,
                fillColor: const Color.fromARGB(255, 207, 207, 207),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: Icon(Icons.person),
              ),
            ),
             Text("Nomor HP"),
            TextField(
              decoration: InputDecoration(
                hintText: "Masukkan Nomor Hp Anda",
                filled: true,
                fillColor: const Color.fromARGB(255, 207, 207, 207),
                border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: Icon(Icons.call),
              ),
            ),
             Text("Email"),
             TextField(
              decoration: InputDecoration(
                hintText: "Masukkan Email Anda",
                filled: true,
                fillColor: const Color.fromARGB(255, 207, 207, 207),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: Icon(Icons.message),
              ),
            ),
            Text("Password"),
             TextField(
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 207, 207, 207),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: Icon(Icons.key),
              ),
            ),
            Text("Konfirmasi Password"),
             TextField(
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 207, 207, 207),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: Icon(Icons.key),
              ),
            ),
          ],
        ),
        ),
    );
  }
}