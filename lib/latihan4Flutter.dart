import 'package:flutter/material.dart';

class dataUser extends StatelessWidget {
  const dataUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 50, 250, 233),
        title: Text('Data User', style: TextStyle(color: Color(0xFFEECBAF))),
      ),

      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ListView(
          children: [
            Text(
              'Form Data User',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
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
            SizedBox(height: 20),

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
            SizedBox(height: 20),

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
            SizedBox(height: 20),

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
            SizedBox(height: 20),

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

            ListTile(
              leading: Icon(Icons.person),
              title: Text("Faris"),
              subtitle: Text("Kulit Berminyak"),
            ),

            ListTile(
              leading: Icon(Icons.person),
              title: Text("Farel"),
              subtitle: Text("Kulit Kering"),
            ),

            ListTile(
              leading: Icon(Icons.person),
              title: Text("Faiz"),
              subtitle: Text("Kulit Sensitif"),
            ),

            ListTile(
              leading: Icon(Icons.person),
              title: Text("Firman"),
              subtitle: Text("Kulit Kombinasi"),
            ),

            ListTile(
              leading: Icon(Icons.person),
              title: Text("Fatih"),
              subtitle: Text("Kulit Normal"),
            ),

            ListTile(
              leading: Icon(Icons.person),
              title: Text("Fahri"),
              subtitle: Text("Kulit Normal"),
            ),
          ],
        ),
      ),
    );
  }
}
