import 'package:miscelaneos/infrastructure/infrastructure.dart';
import 'package:workmanager/workmanager.dart';

const fetchBackgroundTaskKey =
    "com.davidvelasco.miscelaneos.fetch-background-pokemon";
const fetchPeriodicBackgroundTaskKey =
    "com.davidvelasco.miscelaneos.fetch-background-pokemon";

@pragma(
    'vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch (task) {
      case fetchBackgroundTaskKey:
        await loadNextPokemon();
        break;

      // ignore: unreachable_switch_case
      case fetchPeriodicBackgroundTaskKey:
        await loadNextPokemon();
        break;

      case Workmanager.iOSBackgroundTask:
        print('fetchPeriodicBackgroundTaskKey');
        break;
    }

    return true;

    // print("Native called background task: $task"); //simpleTask will be emitted here.
    // return Future.value(true);
  });
}

Future loadNextPokemon() async {
  final localDbRespository = LocalDbRespositoryImpl();
  final pokemonRepostory = PokemonsRepositoryImpl();

  final lastPokemonId = await localDbRespository.pokemonCount() + 1;

  try {
    final (pokemon, message) =
        await pokemonRepostory.getPokemon(id: '$lastPokemonId');
    if (pokemon == null) throw message;

    await localDbRespository.insertPokemon(pokemon);
    print('pokemon inserted: ${pokemon.name}');
  } catch (e) {
    print('$e');
  }
}
