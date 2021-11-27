import 'dart:convert';
import 'dart:developer';

import 'package:pokemon_planet/api_controller/api_client.dart';
import 'package:pokemon_planet/api_controller/api_config.dart';
import 'package:pokemon_planet/model/pokemon.dart';

class PokemonNwRepository {
  Future<List<Pokemon>> getPokemonList({required int offset}) async {
    try {
      String url = ApiConfig.getPokemonList(offset);
      var apiClient = getApiClient();
      final response = await apiClient.get(Uri.parse(url));
      var decodedResponse = json.decode(response.body);
      return List.generate(
          decodedResponse['results'].length,
          (index) => Pokemon.fromJson(
              decodedResponse['results'][index], index + offset));
    } catch (e) {
      log(e.toString());
    }
    throw Exception('Failed to load pokemon list');
  }
}
