import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

class LocationScreen extends ConsumerWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final userLocationAsync = ref.watch(userLocationProvider);
    final watchLocationAsync = ref.watch(watchLocationProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubication'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            //!current
            const Text('current location'),
            userLocationAsync.when(
              data: (data) => Text('$data'),
              error: (error, stackTrace) => Text('$error'),
              loading: () => const CircularProgressIndicator(),
            ),

            const SizedBox(height: 30),
            //!current
            const Text('follow location'),
            watchLocationAsync.when(
              data: (data) => Text('$data'),
              error: (error, stackTrace) => Text('$error'),
              loading: () => const CircularProgressIndicator(),
            ),

          ],
        ),
      ),
    );
  }
}
