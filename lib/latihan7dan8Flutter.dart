import 'package:flutter/material.dart';
import 'package:latihan_flutter_dasar/HomePage.dart';
import 'package:latihan_flutter_dasar/productpage.dart';

class NavigasiDrawer extends StatefulWidget {
  const NavigasiDrawer({super.key});
  static const String routeName = "/latihnavbar";

  @override
  State<NavigasiDrawer> createState() => NavigasiDrawerState();
}

class NavigasiDrawerState extends State<NavigasiDrawer> {
  bool isChecked = false;
  bool isOn = false;
  int _selectedIndex = 0;
  String? selected;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  final List<Widget> _pages = [const HomePage(), const Productpage()];

  void _onDrawerTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context);
  }

  void _onBottomNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text(
          "Input Navigator Interaktif",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.amber),
              child: Text(
                "Menu",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text(
                "Home",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              selected: _selectedIndex == 0,
              onTap: () {
                _onDrawerTapped(0);
              },
            ),

            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(
                "Product",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              selected: _selectedIndex == 1,
              onTap: () {
                _onDrawerTapped(1);
              },
            ),
          ],
        ),
      ),

      body: _pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber,
        onTap: _onBottomNavTapped,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: "Product",
          ),
        ],
      ),
    );
  }
}
