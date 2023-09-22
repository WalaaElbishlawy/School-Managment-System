import 'package:http/http.dart' as http;
import 'dart:convert';

final baseUrl = 'http://127.0.0.1:8000/api/classes';

Future<Map<String, dynamic>> createClass(Map<String, dynamic> data) async {
  final response = await http.post(
    Uri.parse(baseUrl),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(data),
  );

  if (response.statusCode == 201) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to create class');
  }
}

Future<Map<String, dynamic>> getClassDetails(int id) async {
  final response = await http.get(Uri.parse('$baseUrl/$id'));

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load class details');
  }
}
