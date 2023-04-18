import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/joke.dart';

class JokeApiService {
  static const String _baseUrl = 'https://icanhazdadjoke.com';

  Future<Joke> fetchRandomJoke() async {
    final response = await http.get(
      Uri.parse('$_baseUrl'),
      headers: {'Accept': 'application/json'},
    );
    if (response.statusCode == 200) {
      return Joke.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to fetch random dad joke.');
    }
  }

  Future<List<Joke>> searchJokes(String searchTerm) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/search?term=$searchTerm'),
      headers: {'Accept': 'application/json'},
    );
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final List<dynamic> results = jsonResponse['results'];
      return results.map((result) => Joke.fromJson(result)).toList();
    } else {
      throw Exception('Failed to fetch dad jokes by search term.');
    }
  }
}
