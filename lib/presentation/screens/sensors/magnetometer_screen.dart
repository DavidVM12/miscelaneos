import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class MagnetometerScreen extends ConsumerWidget {
  const MagnetometerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final magnetometer = ref.watch(magnetometerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Magnetometer'),
      ),
      body: Center(
          child: magnetometer.when(
        data: (data) =>
            Text(data.toString(), style: const TextStyle(fontSize: 30)),
        error: (error, stackTrace) => Text('Error: $error'),
        loading: () => const CircularProgressIndicator(),
      )),
    );
  }
}
