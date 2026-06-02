import 'package:flutter/material.dart';
import 'package:latihan_flutter_dasar/database/databasehelper.dart';
import 'package:latihan_flutter_dasar/models/user_model_sql.dart';

class daftarUser extends StatefulWidget {
  const daftarUser({super.key});

  @override
  State<daftarUser> createState() => _daftarUserState();
}

class _daftarUserState extends State<daftarUser> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void register() async {
    final nama = namaController.text.trim();
    final email = emailController.text.trim();
    final pass = passwordController.text;

    if (nama.isEmpty || email.isEmpty || pass.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Mohon Mengisi semua field')),
      );
      return;
    }

    final user = UserModelSql(nama: nama, email: email, password: pass);
    bool success = await DBHelper().registerUser(user);

    if (!mounted) return;

    if (success) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Akun Berhasil Dibuat')));
      setState(() {});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email Anda Sudah Terdaftar')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          textTitleForm("Email"),
          SizedBox(height: 12),

          textFormConst(
            controller: emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Email tidak boleh kosong";
              } else if (!value.contains('@')) {
                return "Format email tidak valid";
              }
              return null;
            },
            hintText: "Masukkan Email",
          ),
          SizedBox(height: 24),

          textTitleForm("Password"),
          SizedBox(height: 12),

          textFormConst(
            controller: passwordController,
            hintText: "Masukkan Password",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Password tidak boleh kosong";
              } else if (value.length < 6) {
                return "Password terlalu singkat";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
