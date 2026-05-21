import 'package:flutter/material.dart';

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

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home'),
    Text('Settings Page'),
    Text('Profile Page'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context); // Close the drawer
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
          children: <Widget>[
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
                _onItemTapped(0);
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
                _onItemTapped(1);
              },
            ),
          ],
        ),
      ),

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            Checkbox(
              value: isChecked,
              onChanged: (bool? newValue) {
                setState(() {
                  isChecked = newValue ?? false;
                });
              },
            ),
            Text(isChecked ? 'Begini caranya bro' : 'Teken tombolnya bang'),

            SizedBox(height: 30),
            Switch(
              value: isOn,
              onChanged: (val) {
                setState(() {
                  isOn = val;
                });
              },
            ),
            Text(isOn ? 'On' : 'Off'),
          ],
        ),
      ),
    );
  }
}
