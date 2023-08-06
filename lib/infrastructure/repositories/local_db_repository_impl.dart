import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/infrastructure/datasources/isar_local_db_datasource.dart';

class LocalDbRespositoryImpl implements LocalDbRepository {
  final LocalDbDataSource _dataSource;

  LocalDbRespositoryImpl([LocalDbDataSource? dataSource])
      : _dataSource = dataSource ?? IsarLocalDbDatasource();

  @override
  Future<void> insertPokemon(Pokemon pokemon) {
    return _dataSource.insertPokemon(pokemon);
  }

  @override
  Future<List<Pokemon>> loadPokemons() {
    return _dataSource.loadPokemons();
  }

  @override
  Future<int> pokemonCount() {
    return _dataSource.pokemonCount();
  }
}
