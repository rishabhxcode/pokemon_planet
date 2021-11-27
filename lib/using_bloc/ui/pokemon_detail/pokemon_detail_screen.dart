import 'package:flutter/material.dart';

class PokemonDetailScreen extends StatefulWidget {
  static const routeName = '/pokemon-detail';
  const PokemonDetailScreen({Key? key}) : super(key: key);

  @override
  _PokemonDetailScreenState createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon Detail'),
      ),
      body: const Center(
        child: Text('Pokemon Detail'),
      ),
    );
  }
}
