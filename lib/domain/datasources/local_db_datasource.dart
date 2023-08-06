

import 'package:miscelaneos/domain/domain.dart';

abstract class LocalDbDataSource {

  Future<List<Pokemon>> loadPokemons();

  Future<int> pokemonCount();

  Future<void> insertPokemon(Pokemon pokemon);
}