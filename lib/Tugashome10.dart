// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Tugashome extends StatefulWidget {
  final String nama, email, password;

  const Tugashome({
    super.key,
    required this.nama,
    required this.password,
    required this.email,
  });

  static const String routeName = "/controller";

  @override
  State<Tugashome> createState() => _TugashomeState();
}

class _TugashomeState extends State<Tugashome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.nama),
          Text(widget.email),
          Text(widget.password),
        ],
      ),
    );
  }
}
