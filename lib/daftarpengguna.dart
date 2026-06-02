import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:latihan_flutter_dasar/database/databasehelper.dart';
import 'package:latihan_flutter_dasar/extension/extension.dart';
import 'package:latihan_flutter_dasar/formLogin.dart';
import 'package:latihan_flutter_dasar/models/user_model_sql.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void register() async {
    final email = emailController.text.trim();
    final pass = passwordController.text;

    if (email.isEmpty || pass.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Isi semua field woi!')));
      return;
    }

    final user = UserModelSql(email: email, password: pass);
    bool success = await DBHelper().registerUser(user);

    if (!mounted) return;

    if (success) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Akun berhasil dibuat')));
      context.push(Formlogin());
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Email sudah terdaftar!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center),
                    SizedBox(height: 24),

                    Container(
                      padding: EdgeInsets.all(24),
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Create an account or log in to explore our app",
                          ),

                          SizedBox(height: 24),

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
                          SizedBox(height: 24),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Remember Me",
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),

                          SizedBox(
                            height: 48,
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: register,
                              child: Text(
                                "Register",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 24),
                          Text.rich(
                            TextSpan(
                              text: "Have an account? ",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => context.push(Formlogin()),
                              children: [
                                TextSpan(
                                  text: "Sign In",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextFormField textFormConst({
    required String hintText,
    required String? Function(String?)? validator,
    required TextEditingController controller,
  }) {
    return TextFormField(
      onChanged: (value) {
        setState(() {});
      },
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: borderConst(),
        focusedBorder: borderConst(),
        border: borderConst(),
      ),
    );
  }

  OutlineInputBorder borderConst() {
    return OutlineInputBorder(borderRadius: BorderRadius.circular(10));
  }

  Widget textTitleForm(String text) =>
      Row(children: [Text(text, style: TextStyle(fontSize: 12))]);
}
