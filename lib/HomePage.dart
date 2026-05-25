import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isChecked = false;
  bool isOn = false;
  String? selected;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),

      child: ListView(
        children: [
          Column(
            children: [
              const SizedBox(height: 20),

              TextField(
                decoration: InputDecoration(
                  hintText: "Masukkan Nama Anda",
                  filled: true,
                  fillColor: const Color.fromARGB(255, 207, 207, 207),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),

                  prefixIcon: const Icon(Icons.person),
                ),
              ),

              const SizedBox(height: 10),

              Checkbox(
                value: isChecked,
                onChanged: (bool? newValue) {
                  setState(() {
                    isChecked = newValue ?? false;
                  });
                },
              ),

              Text(isChecked ? 'Begini caranya bro' : 'Teken tombolnya bang'),

              const SizedBox(height: 20),

              Switch(
                value: isOn,
                onChanged: (val) {
                  setState(() {
                    isOn = val;
                  });
                },
              ),

              Text(isOn ? 'Aktifkan Mode Terang' : 'Aktifkan Mode Gelap'),

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

              const SizedBox(height: 30),

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

              const SizedBox(height: 30),

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

                child: const Text('Silahkan memilih Jam'),
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
    );
  }
}
