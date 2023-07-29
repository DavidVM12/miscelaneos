import 'package:miscelaneos/domain/entities/pokemon.dart';

abstract class PokemonsDataSource {
  Future<(Pokemon?, String)> getPokemon({required String id});
}
