import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokemon_planet/repository/pokemon_list/app_pokemon_repository.dart';
import 'package:pokemon_planet/routes/route_generator.dart';
import 'package:pokemon_planet/using_bloc/ui/screens/splash_screen.dart';

import 'repository/pokemon_list/pokemon_repository.dart';
import 'using_bloc/bloc/pokemon_list/pokemon_list_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('pokemon-list');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<PokemonRepository>(
        create: (context) => AppPokemonRepository(),
        child: BlocProvider<PokemonListBloc>(
          create: (context) => PokemonListBloc(
            pokemonRepository:
                RepositoryProvider.of<PokemonRepository>(context),
          ),
          child: MaterialApp(
              title: 'Pokemon Planet',
              onGenerateRoute: RouteGenerate.generateRoute,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const SplashScreen()),
        ));
  }
}
