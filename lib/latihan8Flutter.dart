import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => Bottom_NavbarState();
}

class Bottom_NavbarState extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Masukkan Nama Anda",
                    filled: true,
                    fillColor: const Color.fromARGB(255, 207, 207, 207),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ],
            ),
          ],
        )
      );
  }
}
