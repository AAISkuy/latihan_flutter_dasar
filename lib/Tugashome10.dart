// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:latihan_flutter_dasar/database/preferences_handler.dart';
import 'package:latihan_flutter_dasar/extension/extension.dart';
import 'package:latihan_flutter_dasar/formLogin.dart';

class Tugashome extends StatefulWidget {
  final String nama, email, password;

  const Tugashome({
    super.key,
    required this.nama,
    required this.email,
    required this.password,
  });

  static const String routeName = "/controller";

  @override
  State<Tugashome> createState() => _TugashomeState();
}

class _TugashomeState extends State<Tugashome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.nama),
            Text(widget.email),
            Text(widget.password),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {
                await PreferencesHandler.logOut();
                context.pushAndRemoveAll(const Formlogin());
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
