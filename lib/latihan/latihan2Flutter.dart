import 'package:flutter/material.dart';

class layoutKomp extends StatelessWidget {
  const layoutKomp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 43, 216, 202),
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
              "Aplikasi Rekomendasi Skincare Sesuai Jenis Kulit Anda",
              style: TextStyle(
                color: Color(0xFFF0A8D6),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),

      body: Container(
        padding: const EdgeInsets.all(25),

        child: Column(
          children: [

            Container(
              height: 50,

              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 43, 216, 202),
                borderRadius: BorderRadius.circular(20),

                boxShadow: const [
                  BoxShadow(
                    offset: Offset(1, 1),
                    blurStyle: BlurStyle.outer,
                    blurRadius: 5,
                  ),
                ],
              ),

              child: Row(
                children: const [
                  SizedBox(width: 10),

                  Icon(Icons.email, color: Colors.black54),

                  SizedBox(width: 15),

                  Text(
                    "ahmadfizalal21@gmail.com",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),

             const SizedBox(height: 20),

             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),

              child: Row(
                children: const [
                  Icon(Icons.phone, size: 20),

                  SizedBox(width: 10),

                  Text("0851-xxxx-xxxx"),

                  Spacer(),

                  Icon(Icons.location_city, size: 20),

                  SizedBox(width: 5),

                  Text("Jakarta"),
                ],
              ),
            ),
             
             const SizedBox(height: 25),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),

              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),

                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(15),
                      ),

                      child: const Column(
                        children: [
                          SizedBox(height: 10),

                          Text("100++", 
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,),),
                          Text("SkinCare"),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),

                      decoration: BoxDecoration(
                        color: Colors.lightGreen.shade100,
                        borderRadius: BorderRadius.circular(15),
                      ),

                      child: const Column(
                        children: [
                          SizedBox(height: 10),
                          Text("100 RB +", 
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,),),
                          Text("Pengguna"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // DESKRIPSI
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),

              child: Text(
                "CareSkin+ adalah aplikasi Rekomendasi Skincare "
                "yang membantu pengguna mengetahui Jenis Kulit dan Skincare yang Cocok untuk Anda "
                "dengan tampilan sederhana dan mudah dipahami.",

                style: TextStyle(fontSize: 16, height: 1.5),

                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}