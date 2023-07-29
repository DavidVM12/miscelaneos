import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/infrastructure/datasources/pokemons_datasorce_impl.dart';

class PokemonsRepositoryImpl implements PokemonsRepository {
  final PokemonsDataSource dataSource;

  PokemonsRepositoryImpl({PokemonsDataSource? dataSource})
      : dataSource = dataSource ?? PokemonsDataSourceImpl();

  @override
  Future<(Pokemon?, String)> getPokemon({required String id}) async {
    return dataSource.getPokemon(id: id);
  }
}
