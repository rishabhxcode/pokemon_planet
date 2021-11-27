import 'package:flutter/material.dart';
import 'package:pokemon_planet/helper/string_extensions.dart';
import 'package:pokemon_planet/model/pokemon.dart';
import 'package:pokemon_planet/using_bloc/ui/pokemon_detail/pokemon_detail_screen.dart';

class PokemonItem extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonItem({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        highlightColor: Colors.blue.shade200.withOpacity(0.2),
        splashColor: Colors.blue.shade200.withOpacity(0.3),
        onTap: () {
          Navigator.pushNamed(context, PokemonDetailScreen.routeName);
        },
        child: Container(
            height: 200,
            clipBehavior: Clip.antiAlias,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
                width: 0.25,
              ),
              borderRadius: BorderRadius.circular(8),
              color: Colors.blue[100]!.withOpacity(0.1),
            ),
            child: Column(
              children: [
                Text(
                  '${pokemon.index! + 1}. ${pokemon.name.capitalize()}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.normal),
                ),
                Expanded(
                  flex: 2,
                  child: Image.network(
                    pokemon.image,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Text(
                          'Image not available',
                          style: TextStyle(color: Colors.red),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
