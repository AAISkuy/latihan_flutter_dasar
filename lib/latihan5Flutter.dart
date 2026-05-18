import 'package:flutter/material.dart';

class logikaVisual extends StatefulWidget {
  const logikaVisual({super.key});

  @override
  State<logikaVisual> createState() => _logikaVisualState();
}

class _logikaVisualState extends State<logikaVisual> {
  bool showImageT = false;
  bool showImageS = false;
  bool like = false;
  bool Ltext = false;
  @override
  Widget build(BuildContext context) {
    print('Ujicoba');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFFFFFFF),
        title: Text(
          'CareSkin+',
          style: TextStyle(
            color: Color(0xFF2E3436),
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            setState(() {
              showImageT = !showImageT;
            });
          },
          icon: Icon(Icons.menu),
        ),
      ),

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                setState(() {
                  showImageS = !showImageS;
                });
              },
              child: Text(
                showImageS ? "Tutup Gambar" : "Sunscreen",
                style: TextStyle(color: Colors.white),
              ),
            ),

            showImageS
                ? Image.asset("assets/images/SunScreen.avif", height: 150)
                : Container(height: 10),

            Text(
              like ? "Suka" : "Tidak Suka",
              style: TextStyle(
                fontSize: 25,
                color: like ? Colors.red : Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  like = !like;
                });
              },
              icon: Icon(
                Icons.favorite,
                size: 50,
                color: like ? Colors.red : Colors.black,
              ),
            ),

            showImageT
                ? Image.asset("assets/images/Toner.png", height: 150)
                : Container(height: 10),
            IconButton(
              onPressed: () {
                setState(() {
                  showImageT = !showImageT;
                });
              },
              icon: Icon(showImageT ? Icons.visibility_off : Icons.visibility),
            ),

            TextButton(
              onPressed: () {
                setState(() {
                  Ltext = !Ltext;
                });
              },
              child: Text("Tekan Disini Untuk Informasi Detail"),
            ),
            Text(
              Ltext
                  ? ""
                  : "Toner adalah Produk Skincare berbentuk cair yang digunakan setelah mencuci wajah untuk membant mempersiapkan kulit sebelum memakai skincare lainnya seperti serum dan moisturizer",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.person),
      ),
    );
  }
}
