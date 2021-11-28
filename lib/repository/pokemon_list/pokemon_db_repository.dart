import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:pokemon_planet/model/pokemon.dart';

class PokemonDbRepository {
  var pokemonHive = Hive.box('pokemon-list');
  Future<void> addPokemonsToLocalDb({required List<Pokemon> pokemons}) async {
    for (var pokemon in pokemons) {
      pokemonHive.add(pokemon.toJson());
    }
  }

  Future<List<Pokemon>> getAllCachedPokemons() async {
    final pokemons = pokemonHive.values.toList();
    final count = pokemons.first['count'];
    return List.generate(
        pokemons.length,
        (index) => Pokemon.fromJson(Map<String, dynamic>.from(pokemons[index]),
            index: index, totalCount: count));
  }

  int get getLocalOffset => pokemonHive.length;
}
