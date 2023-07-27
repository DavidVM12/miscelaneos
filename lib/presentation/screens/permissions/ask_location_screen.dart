import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class AskLocationScreen extends ConsumerWidget {
  const AskLocationScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request permission'),
      ),
      body: Center(
        child: FilledButton(
            onPressed: () {
              ref.read(permissionProvider.notifier).requestLocationAccess();
            },
            child: const Text('Request location permission')),
      ),
    );
  }
}
