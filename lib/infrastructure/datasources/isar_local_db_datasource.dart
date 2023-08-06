import 'package:isar/isar.dart';
import 'package:miscelaneos/domain/domain.dart';
import 'package:path_provider/path_provider.dart';

class IsarLocalDbDatasource extends LocalDbDataSource {
  late Future<Isar> db;

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return Isar.open([PokemonSchema], directory: dir.path);
    }
    return Future.value(Isar.getInstance());
  }

  IsarLocalDbDatasource() {
    db = openDB();
  }

  @override
  Future<void> insertPokemon(Pokemon pokemon) async {
    final isar = await db;

    final done = isar.writeTxnSync(() => isar.pokemons.putSync(pokemon));
    print('Insert done: $done');
  }

  @override
  Future<List<Pokemon>> loadPokemons() async {
    final isar = await db;

    return isar.pokemons.where().findAll();
  }

  @override
  Future<int> pokemonCount() async {
    final isar = await db;
    return isar.pokemons.count();
  }
}
