class Pokemon {
  final String name;
  final String url;
  final String image;
  final int? index;

  Pokemon(
      {required this.name, required this.url, required this.image, this.index});

  static Pokemon fromJson(Map<String, dynamic> json, int index) {
    return Pokemon(
      name: json['name'] as String,
      url: json['url'] as String,
      index: index,
      image:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${index + 1}.png',
    );
  }
}
