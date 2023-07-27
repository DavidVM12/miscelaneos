import 'dart:math' show pi;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';
import 'package:miscelaneos/presentation/screens/screens.dart';

class CompassScreen extends ConsumerWidget {
  const CompassScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final locationGranded = ref.watch(permissionProvider).locationGranted;

    if (!locationGranded) {
      return const AskLocationScreen();
    }

    final compassHeading = ref.watch(compassProvider);

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            title: const Text('Compass', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.black,
            iconTheme: const IconThemeData(color: Colors.white)),
        body: Center(
            child: compassHeading.when(
                data: (data) => Compass(heading: data ?? 0),
                error: (e, s) =>
                    Text('$e', style: const TextStyle(color: Colors.white)),
                loading: () => const CircularProgressIndicator())));
  }
}

class Compass extends StatelessWidget {
  final double heading;
  const Compass({super.key, required this.heading});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${heading.ceil()}',
          style: const TextStyle(color: Colors.white, fontSize: 30),
        ),
        const SizedBox(height: 20),
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/images/compass/quadrant-2.png'),
            Transform.rotate(
                angle: (heading * (pi / 180) * -1),
                child: Image.asset('assets/images/compass/needle-4.png')),
          ],
        )
      ],
    );
  }
}
