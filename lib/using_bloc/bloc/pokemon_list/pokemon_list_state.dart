part of 'pokemon_list_bloc.dart';

abstract class PokemonListState extends Equatable {
  const PokemonListState();

  @override
  List<Object> get props => [];
}

class PokemonListInitial extends PokemonListState {}

class PokemonListLoadingState extends PokemonListState {}

class PokemonListLoadedState extends PokemonListState {
  final List<Pokemon> pokemonList;

  const PokemonListLoadedState({required this.pokemonList});

  PokemonListLoadedState copyWith({
    required List<Pokemon> newPokemonList,
  }) {
    return PokemonListLoadedState(
      pokemonList: newPokemonList,
    );
  }

  @override
  List<Object> get props => [pokemonList];
}

class PokemonListLoadFailedState extends PokemonListState {}
