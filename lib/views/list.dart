import 'package:flutter/material.dart';

class ListDataSkin extends StatefulWidget {
  const ListDataSkin({super.key});

  @override
  State<ListDataSkin> createState() => _ListDataSkinState();
}

class _ListDataSkinState extends State<ListDataSkin> {
  final List<String> namaSkinCare = [
    "Skintific",
    "Somethinc",
    "Wardah",
    "Emina",
    "Scarlett",
    "Avoskin",
    "Originote",
    "Azarine",
    "Whitelab",
    'The Ordinary',
    'COSRX',
    "SK-II",
    'Laneige',
    'Cetaphil',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: namaSkinCare.length,
          itemBuilder: (BuildContext context, int index) {
            print(index);
            return Text(namaSkinCare[index]);
          },
        ),
      ],
    );
  }
}
