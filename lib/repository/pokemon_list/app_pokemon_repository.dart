import 'dart:developer';

import 'package:pokemon_planet/model/pokemon.dart';
import 'package:pokemon_planet/repository/pokemon_list/pokemon_db_repository.dart';
import 'package:pokemon_planet/repository/pokemon_list/pokemon_repository.dart';

import 'pokemon_nw_repository.dart';

class AppPokemonRepository extends PokemonRepository {
  final PokemonNwRepository _pokemonNwRepository = PokemonNwRepository();
  final PokemonDbRepository _pokemonsDbRepository = PokemonDbRepository();
  @override
  Future<List<Pokemon>> getPokemonList({required int offset}) async {
    var localOffset = _pokemonsDbRepository.getLocalOffset;
    if (localOffset != 0) {
      if (offset < localOffset) {
        var pokemons = await _pokemonsDbRepository.getAllCachedPokemons();
        log('LOCAL DB CALL $localOffset');
        return pokemons;
      }
    }
    log('NEWTORK CALL $localOffset');
    var pokemons =
        await _pokemonNwRepository.getPokemonList(offset: localOffset);
    _pokemonsDbRepository.addPokemonsToLocalDb(pokemons: pokemons);
    return pokemons;
  }
}
