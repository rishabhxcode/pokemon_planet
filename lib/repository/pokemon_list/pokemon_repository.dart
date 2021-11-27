import 'package:pokemon_planet/model/pokemon.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> getPokemonList({required int offset});
}
