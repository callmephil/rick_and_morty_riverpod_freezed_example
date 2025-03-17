import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod_example/models/character.dart';

class RickAndMortyService {
  final http.Client _client = http.Client();

  /// Fetch the first page of characters
  Future<List<Character>> fetchCharacters() async {
    final url = Uri.parse('https://rickandmortyapi.com/api/character');
    final response = await _client.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as Map<String, dynamic>;
      final results = jsonData['results'] as List<Object?>;
      return results
          .map((item) => Character.fromJson(item! as Map<String, dynamic>))
          .toList();
    }
    throw Exception(
      'Failed to load characters: ${response.statusCode} ${response.reasonPhrase ?? ''}',
    );
  }

  Future<List<Character>> fetchNextPage(int page) async {
    final url = Uri.parse(
      'https://rickandmortyapi.com/api/character?page=$page',
    );
    final response = await _client.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as Map<String, dynamic>;
      final results = jsonData['results'] as List<Object?>;
      return results
          .map((item) => Character.fromJson(item! as Map<String, dynamic>))
          .toList();
    }
    throw Exception(
      'Failed to load characters: ${response.statusCode} ${response.reasonPhrase ?? ''}',
    );
  }

  /// Fetch a single character by ID
  Future<Character> fetchCharacterById(int characterId) async {
    final url = Uri.parse(
      'https://rickandmortyapi.com/api/character/$characterId',
    );
    final response = await _client.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as Map<String, dynamic>;
      return Character.fromJson(jsonData);
    }
    throw Exception(
      'Failed to load character $characterId: ${response.statusCode} ${response.reasonPhrase ?? ''}',
    );
  }
}
