// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Tugashome extends StatelessWidget {
  final String email, password;

  const Tugashome({super.key, required this.password, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(email), Text(password)],
      ),
    );
  }
}
