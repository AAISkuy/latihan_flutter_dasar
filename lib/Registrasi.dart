import 'package:flutter/material.dart';
import 'package:latihan_flutter_dasar/Tugashome10.dart';
import 'package:latihan_flutter_dasar/database/preferences_handler.dart';
import 'package:latihan_flutter_dasar/extension/extension.dart';

class LamanRegistrasi extends StatefulWidget {
  const LamanRegistrasi({super.key});
  static const String routeName = '/lamanregistrasi';

  @override
  State<LamanRegistrasi> createState() => Laman_RegistrasiState();
}

class Laman_RegistrasiState extends State<LamanRegistrasi> {
  final _formKey = GlobalKey<FormState>();
  final namacontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

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
            width: 400,
            height: 700,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(35),
            ),

            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Container(
                    height: 35,
                    width: 35,
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
                    "Create Account",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7C9A92),
                    ),
                  ),

                  SizedBox(height: 10),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "Masukkan Nama Anda",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF7C9A92),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                        child: TextFormField(
                          controller: namacontroller,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            hintText: "Nama Anda",
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
                              return "Nama tidak boleh kosong";
                            }
                            return null;
                          },
                        ),
                      ),

                      SizedBox(height: 10),

                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "Masukkan Email Anda",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF7C9A92),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                        child: TextFormField(
                          controller: emailcontroller,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            hintText: "Priasawit@gmail.com",
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

                      SizedBox(height: 10),

                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "Masukkan Password Anda",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF7C9A92),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                        child: TextFormField(
                          controller: passwordcontroller,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            hintText: "Password Anda",
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF7C9A92)),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF7C9A92)),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password tidak boleh kosong";
                            } else if (value.length < 6) {
                              return "Password harus terdiri dari minimal 6 karakter";
                            }
                            return null;
                          },
                        ),
                      ),

                      SizedBox(height: 10),

                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "Konfirmasi Password Anda",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF7C9A92),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            hintText: "Konfirmasi Password",
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF7C9A92)),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF7C9A92)),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password tidak boleh kosong";
                            } else if (value != passwordcontroller.text) {
                              return "Password tidak sama";
                            }
                            return null;
                          },
                        ),
                      ),

                      SizedBox(height: 10),

                      Container(
                        margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                print("Sudah memenuhi syarat");
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Berhasil"),
                                      content: Text("Anda berhasil Mendaftar"),
                                      actions: [
                                        TextButton(
                                          onPressed: () async {
                                            await PreferencesHandler.setLogin(
                                              true,
                                            );

                                            await PreferencesHandler.saveUser(
                                              nama: namacontroller.text,
                                              email: emailcontroller.text,
                                              password: passwordcontroller.text,
                                            );
                                            context.push(
                                              Tugashome(
                                                nama: namacontroller.text,
                                                password:
                                                    passwordcontroller.text,
                                                email: emailcontroller.text,
                                              ),
                                            );
                                            // Navigator.pushNamed(
                                            //   context,
                                            //   "/Controller",
                                            // );
                                          },
                                          child: Text("Lanjut"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },

                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF7C9A92),
                            ),

                            child: Text(
                              "Sign Up",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
