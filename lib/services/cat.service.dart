import 'dart:convert';
import 'package:http/http.dart' as http;

class CatService {
  static const String apiUrl =
      "http://10.0.2.2:3000/cats"; // Update with your backend URL

  static Future<List<dynamic>> fetchCats() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception("Failed to load cat data");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
