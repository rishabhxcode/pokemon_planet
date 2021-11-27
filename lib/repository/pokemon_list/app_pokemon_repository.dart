import 'package:pokemon_planet/model/pokemon.dart';
import 'package:pokemon_planet/repository/pokemon_list/pokemon_repository.dart';

import 'pokemon_nw_repository.dart';

class AppPokemonRepository extends PokemonRepository {
  PokemonNwRepository _pokemonNwRepository = PokemonNwRepository();
  @override
  Future<List<Pokemon>> getPokemonList({required int offset}) {
    return _pokemonNwRepository.getPokemonList(offset: offset);
  }
}
