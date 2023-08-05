import 'package:go_router/go_router.dart';

import '../../presentation/screens/screens.dart';

final router = GoRouter(routes: [
  //!general
  GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
  GoRoute(
      path: '/permissions',
      builder: (context, state) => const PermissionScreen()),

  //!sensors
  GoRoute(
      path: '/gyroscope', builder: (context, state) => const GyroscopeScreen()),

  GoRoute(
      path: '/accelerometer',
      builder: (context, state) => const AccelerometerScreen()),

  GoRoute(
      path: '/magnetometer',
      builder: (context, state) => const MagnetometerScreen()),

  GoRoute(
      path: '/gyroscope-ball',
      builder: (context, state) => const GyroscopeBallScreen()),

  GoRoute(path: '/compass', builder: (context, state) => const CompassScreen()),

  //!pokemons
  GoRoute(
      path: '/pokemons',
      builder: (context, state) => const PokemonsScreen(),
      routes: [
        GoRoute(
            path: ':id',
            builder: (context, state) {
              final id = state.pathParameters['id'].toString();

              return PokemonScreen(pokemonId: id);
            }),
      ]),


  //!biometric	
  GoRoute(
      path: '/biometric',
      builder: (context, state) => const BiometricScreen()),
]);
