import 'dart:convert';

// import 'package:api_flutter/main.dart';
import 'package:http/http.dart' as http;

import '../models/antaraModel.dart';

class DataRepository {
  final String baseUrl =
      'https://api-berita-indonesia.vercel.app/antara/terbaru/';

  Future<DataBerita> fetchData() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        final jsonBody = jsonDecode(response.body);
        return DataBerita.fromJson(jsonBody['data']);
      }
    } catch (e) {
      print(e.toString());
    }
    return DataBerita(
      link: '',
      image: '',
      description: '',
      title: '',
      posts: [],
    ); // Mengembalikan objek DataBerita kosong jika terjadi kesalahan
  }

}