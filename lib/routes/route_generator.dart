import 'package:flutter/material.dart';
import 'package:pokemon_planet/using_bloc/ui/pokemon_detail/pokemon_detail_screen.dart';
import 'package:pokemon_planet/using_bloc/ui/pokemon_list/pokemon_list_screen.dart';
import 'package:pokemon_planet/using_bloc/ui/screens/splash_screen.dart';

class RouteGenerate {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case (PokemonListScreen.routeName):
        return MaterialPageRoute(
          builder: (context) => const PokemonListScreen(),
        );
      case (PokemonDetailScreen.routeName):
        return MaterialPageRoute(
          builder: (context) => const PokemonDetailScreen(),
        );
      default:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
}
