import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';

class ApiService {
  Future<List<dynamic>> fetchArticles() async {
    try {
      final response = await http
          .get(Uri.parse(AppConstants.apiUrl))
          .timeout(AppConstants.apiTimeout);

      if (response.statusCode == HttpStatus.ok) {
        return json.decode(response.body) as List;
      } else {
        throw Exception('Failed to load articles: ${response.statusCode}');
      }
    } on SocketException {
      throw Exception('No Internet connection');
    } on HttpException {
      throw Exception('Could not reach the server');
    } on FormatException {
      throw Exception('Bad response format');
    } catch (e) {
      throw Exception('Failed to load articles: $e');
    }
  }
}