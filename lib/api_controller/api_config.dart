class ApiConfig {
  static String getPokemonList(int offset) =>
      "https://pokeapi.co/api/v2/pokemon?offset=$offset&limit=20";
}
