import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_planet/using_bloc/bloc/pokemon_list/pokemon_list_bloc.dart';
import 'package:pokemon_planet/using_bloc/ui/pokemon_list/widgets/pokemon_item.dart';

class PokemonListScreen extends StatefulWidget {
  static const routeName = '/pokemon-list';
  const PokemonListScreen({Key? key}) : super(key: key);

  @override
  _PokemonListScreenState createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  final ScrollController _scrollController = ScrollController();

  bool _isReachedMax = true;

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels.toInt() >=
          (_scrollController.position.maxScrollExtent.toInt() - 500)) {
        if (_isReachedMax) {
          log('Reached Max');
          BlocProvider.of<PokemonListBloc>(context).add(
              const LoadPokemonsEvent(isReset: false, hasReachedEnd: true));
        }
        _isReachedMax = false;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon'),
      ),
      body: BlocConsumer<PokemonListBloc, PokemonListState>(
        listener: (context, state) {
          if (state is PokemonListLoadedState) {
            _isReachedMax = true;
          }
        },
        builder: (context, state) {
          log('CURRENT STATE: $state');
          if (state is PokemonListLoadedState) {
            return ListView.builder(
                itemCount: state.pokemonList.length,
                controller: _scrollController,
                addAutomaticKeepAlives: true,
                addRepaintBoundaries: true,
                itemBuilder: (context, index) {
                  return PokemonItem(
                    pokemon: state.pokemonList[index],
                  );
                });
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
