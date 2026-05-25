import 'package:flutter/material.dart';
import 'package:latihan_flutter_dasar/data/Skincare_data_with_models.dart';

class ListWithModelDataSkin extends StatefulWidget {
  const ListWithModelDataSkin({super.key});

  @override
  State<ListWithModelDataSkin> createState() => _ListWithModelDataSkinState();
}

class _ListWithModelDataSkinState extends State<ListWithModelDataSkin> {
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
              final data = skincareListWithModels[index];
              return Container(
                color: index % 2 == 0 ? Colors.blue : Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.spa, size: 50, color: Color(0xFFFADADD)),

                    const SizedBox(height: 10),

                    Text(
                      data.brand,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      data.productName,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 14),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      data.category,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(data.skinType, style: const TextStyle(fontSize: 12)),
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
