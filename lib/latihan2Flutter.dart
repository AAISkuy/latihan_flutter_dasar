import 'package:flutter/material.dart';

class layoutKomp extends StatelessWidget {
  const layoutKomp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        backgroundColor: Colors.teal,
        title:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Text("CareSkin+",
        style: TextStyle(color: Color(0xFFEECBAF), fontSize:24),),
        Text("Aplikasi Rekomendasi Skincare Sesuai Jenis Kulit Anda",
        style: TextStyle(color: Color(0xFFF0A8D6), fontSize:14),),
        ],
      ),
    ),

     body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 43, 216, 202),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(1, 1),
                    blurStyle: BlurStyle.outer,
                    blurRadius: 5,
                  ),
                ],
              ),
            )
            ]
        )
    )
    );
  }
}