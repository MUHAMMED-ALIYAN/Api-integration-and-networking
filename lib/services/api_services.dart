import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_app/models/user_models.dart';

class ApiService {
  static const String baseUrl = "https://jsonplaceholder.typicode.com";

  static Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse("$baseUrl/users"));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load users: ${response.statusCode}");
    }
  }
}
