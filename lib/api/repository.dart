import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/index.dart';

class Repository {
  final _baseUrl = 'https://api-berita-indonesia.vercel.app/';

  Future<List<Endpoint>> getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        final jsonBody = jsonDecode(response.body);
        final endpointsJson = jsonBody['endpoints'] as List<dynamic>;

        // Mengurai setiap endpoint JSON menjadi objek Endpoint
        final endpoints = endpointsJson
            .map((endpointJson) => Endpoint.fromJson(endpointJson))
            .toList();

        return endpoints;
      }
    } catch (e) {
      print(e.toString());
    }
    return []; // Mengembalikan daftar kosong jika terjadi kesalahan atau respons tidak valid
  }
}
