import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_planet/using_bloc/bloc/pokemon_list/pokemon_list_bloc.dart';
import 'package:pokemon_planet/using_bloc/ui/pokemon_list/pokemon_list_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    BlocProvider.of<PokemonListBloc>(context)
        .add(const LoadPokemonsEvent(hasReachedEnd: false, isReset: true));
    Future.delayed(const Duration(milliseconds: 2000), () {
      Navigator.pushReplacementNamed(context, PokemonListScreen.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
            widthFactor: 0.5,
            child: Image.asset('assets/images/poke_logo.png')),
      ),
    );
  }
}
