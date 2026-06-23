import 'package:flutter/material.dart';
import 'package:latihan_flutter_dasar/models/crypto_models.dart';
import 'package:latihan_flutter_dasar/services/api_services.dart';
import 'package:latihan_flutter_dasar/services/dio_client.dart';

class Cryptolistscreen extends StatefulWidget {
  const Cryptolistscreen({super.key});

  @override
  State<Cryptolistscreen> createState() => _CryptolistscreenState();
}

class _CryptolistscreenState extends State<Cryptolistscreen> {
  late final ApiService _apiService;
  late Future<List<CryptoModels>> _postsFuture;

  @override
  void initState() {
    super.initState();
    final dio = createDioClient();
    _apiService = ApiService(dio);
    _postsFuture = _apiService.getAllPosts();
  }

  void _refreshPost() {
    setState(() {
      _postsFuture = _apiService.getAllPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kais Crypto", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder<List<CryptoModels>>(
        future: _postsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Padding(padding: EdgeInsets.all(24)));
          }
        },
      ),
    );
  }
}
