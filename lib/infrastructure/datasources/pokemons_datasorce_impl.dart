import 'package:dio/dio.dart';
import 'package:miscelaneos/infrastructure/mappers/pokemon_mapper.dart';

import '../../domain/domain.dart';

class PokemonsDataSourceImpl implements PokemonsDataSource {
  final Dio dio;

  PokemonsDataSourceImpl()
      : dio = Dio(BaseOptions(baseUrl: 'https://pokeapi.co/api/v2'));

  @override
  Future<(Pokemon?, String)> getPokemon({required String id}) async {
    try {
      final response = await dio.get('/pokemon/$id');

      final pokemon = PokemonMapper.pokeApiPokemonToEntity(response.data);

      return (pokemon, 'getting data correctly');
    } catch (e) {
      return (null, 'Dont found pokemon $e');
    }
  }
}
