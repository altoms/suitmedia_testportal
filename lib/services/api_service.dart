import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:suitmedia_testportal/models/user.dart';

class Apiservice {
  Future<List<User>> fetchUsers() async {
    final response = await http
        .get(Uri.parse('https://reqres.in/api/users?page=1&per_page=10'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data'] as List;
      return data.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
