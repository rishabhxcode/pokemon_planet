class Pokemon {
  final String name;
  final String url;
  final String image;
  final int? index;
  final int totalCount;

  Pokemon(
      {required this.name,
      required this.url,
      required this.image,
      this.index,
      required this.totalCount});

  static Pokemon fromJson(Map<String, dynamic> json,
      {required int index, required int totalCount}) {
    return Pokemon(
      name: json['name'] as String,
      url: json['url'] as String,
      index: index,
      totalCount: totalCount,
      image:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${index + 1}.png',
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
        'image': image,
        'index': index,
        'count': totalCount,
      };
}
