part of 'pokemon_list_bloc.dart';

abstract class PokemonListEvent extends Equatable {
  const PokemonListEvent();

  @override
  List<Object> get props => [];
}

class LoadPokemonsEvent extends PokemonListEvent {
  final bool isReset;
  final bool hasReachedEnd;

  const LoadPokemonsEvent({required this.isReset, required this.hasReachedEnd});

  @override
  List<Object> get props => [isReset, hasReachedEnd];
}
