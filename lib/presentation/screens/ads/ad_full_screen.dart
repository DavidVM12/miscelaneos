import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class AdFullScreen extends ConsumerWidget {
  const AdFullScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final interstitialAsync = ref.watch(adInterstitialProvider);

    ref.listen(adInterstitialProvider, (previous, next) {
      if (!next.hasValue) return;

      if (next.value == null) return;

      next.value!.show();
    });
    
    if (interstitialAsync.isLoading) {
      return const Scaffold(
        body: Center(
          child: Text('Loading ad'),
        ),
      );
    }


    if (interstitialAsync.hasValue) {
      interstitialAsync.value!.show();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ad Full Screen'),
      ),
      body: const Center(
        child: Text('You can come back or see this screen'),
      ),
    );
  }
}
