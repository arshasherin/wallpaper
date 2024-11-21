import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://api.unsplash.com";
  static const String accessKey = "HYADEDbJO6TmZuTvLLDBNOe0o1T0LqZvLOfSRVdWh_o";

  Future<List<dynamic>> fetchWallpaper(int page, int perPage) async {
   final url = Uri.parse("$baseUrl/photos?page=$page&per_page=$perPage");
    final response = await http.get(
      url,
      headers: {"Authorization": "Client-ID $accessKey"},
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load wallpapers");
    }
  }
}
