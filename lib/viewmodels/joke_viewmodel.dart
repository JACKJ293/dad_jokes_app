import 'package:flutter/material.dart';
import '../models/joke.dart';
import '../services/joke_api_service.dart';

class JokeViewModel extends ChangeNotifier {
  final JokeApiService _apiService = JokeApiService();

  Joke? _randomJoke;
  List<Joke> _searchResults = [];

  Joke? get randomJoke => _randomJoke;
  List<Joke> get searchResults => _searchResults;

  Future<void> fetchRandomJoke() async {
    _randomJoke = await _apiService.fetchRandomJoke();
    notifyListeners();
  }

  Future<void> searchJokes(String searchTerm) async {
    _searchResults = await _apiService.searchJokes(searchTerm);
    _searchResults.sort((a, b) => a.id.compareTo(b.id));
    notifyListeners();
  }
}
