import 'package:flutter/material.dart';
import 'package:latihan_flutter_dasar/latihan/data/Skincare_data_with_models.dart';
import 'package:latihan_flutter_dasar/latihan/data/Skincare_list.dart';

class ListWithMapDataSkin extends StatefulWidget {
  const ListWithMapDataSkin({super.key});

  @override
  State<ListWithMapDataSkin> createState() => _ListWithModelDataSkinState();
}

class _ListWithModelDataSkinState extends State<ListWithMapDataSkin> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.all(8),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
            itemCount: skincareListWithModels.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: index % 2 == 0 ? Colors.blue : Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      skincareList[index]['brand'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      skincareList[index]['category'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 14),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      skincareList[index]['benefit'],
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
