import 'package:flutter/material.dart';

class LamanRegistrasi extends StatefulWidget {
  const LamanRegistrasi({super.key});

  @override
  State<LamanRegistrasi> createState() => Laman_RegistrasiState();
}

class Laman_RegistrasiState extends State<LamanRegistrasi> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(35),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF6F1EE), Color.fromARGB(255, 214, 236, 238)],
          ),
        ),

        child: Center(
          child: Container(
            width: 360,
            height: 700,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(35),
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/kp2_dm.gif"),
                    ),
                  ),
                ),

                Text(
                  "Skinoura",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7C9A92),
                  ),
                ),

                SizedBox(height: 10),

                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 5,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            hintText: "Masukkan Email Anda",
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF7C9A92)),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF7C9A92)),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email tidak boleh kosong";
                            } else if (!value.contains('@')) {
                              return "Format Email tidak valid";
                            }
                            return null;
                          },
                        ),
                      ),
              ],
            ),
              ]
          ),
        ),
      ),
    );
  }
}
