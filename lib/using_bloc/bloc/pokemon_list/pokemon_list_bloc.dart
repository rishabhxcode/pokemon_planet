import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon_planet/model/pokemon.dart';
import 'package:pokemon_planet/repository/pokemon_list/pokemon_repository.dart';

part 'pokemon_list_event.dart';
part 'pokemon_list_state.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  final PokemonRepository pokemonRepository;
  PokemonListBloc({required this.pokemonRepository})
      : super(PokemonListInitial()) {
    on<LoadPokemonsEvent>((event, emit) async {
      try {
        if (state is PokemonListLoadedState && !event.isReset) {
          var currentState = state as PokemonListLoadedState;
          log('Total Pokemons: ${currentState.pokemonList.length}');
          if (event.hasReachedEnd) {
            var pokemons = await pokemonRepository.getPokemonList(
                offset: currentState.pokemonList.length);
            emit(currentState.copyWith(
                newPokemonList: currentState.pokemonList + pokemons));
          }
        } else {
          emit(PokemonListLoadingState());
          var pokemons = await pokemonRepository.getPokemonList(offset: 0);
          emit(PokemonListLoadedState(pokemonList: pokemons));
        }
      } catch (e) {
        log(e.toString());
        emit(PokemonListLoadFailedState());
      }
    });
  }
}
