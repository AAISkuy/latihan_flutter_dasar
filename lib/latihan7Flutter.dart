import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Index 0: Home'),
    Text('Index 1: Settings Page'),
    Text('Index 2: Profile Page'),
  ];

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

      body: Container(
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
                SizedBox(height: 10),
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      isChecked = newValue ?? false;
                    });
                  },
                ),
                Text(isChecked ? 'Begini caranya bro' : 'Teken tombolnya bang'),

                SizedBox(height: 20),
                Switch(
                  value: isOn,
                  onChanged: (val) {
                    setState(() {
                      isOn = val;
                    });
                  },
                ),
                Text(isOn ? 'Aktifkan Mode Teramg' : 'Aktifkan Mode Gelap'),

                const SizedBox(height: 30),

                DropdownButton<String>(
                  value: selected,
                  hint: const Text("Domisili"),

                  items:
                      [
                        'Jakarta Pusat',
                        'Jakarta Barat',
                        'Jakarta Utara',
                        'Jakarta Timur',
                      ].map((String val) {
                        return DropdownMenuItem<String>(
                          value: val,
                          child: Text(val),
                        );
                      }).toList(),

                  onChanged: (val) {
                    setState(() {
                      selected = val;
                    });
                  },
                ),

                SizedBox(height: 30),

                ElevatedButton(
                  onPressed: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );

                    if (picked != null) {
                      setState(() {
                        selectedDate = picked;
                      });
                    }
                  },

                  child: const Text('Silahkan memilih Tanggal'),
                ),

                Text(
                  selectedDate == null
                      ? "Belum pilih tanggal"
                      : DateFormat(
                          'EEE, dd MMMM yyyy',
                          'id_ID',
                        ).format(selectedDate!),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () async {
                    final TimeOfDay? picked = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (picked != null) {
                      setState(() {
                        selectedTime = picked;
                      });
                    }
                  },
                  child: Text('Silahkan memilih Jam'),
                ),
                Text(
                  selectedTime == null
                      ? "Anda belum memilih jam"
                      : "${selectedTime!.hour}:${selectedTime!.minute}",
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onBottomNavTapped,
      ),
    );
  }
}
