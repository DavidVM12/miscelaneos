import 'package:flutter/material.dart';

class MagnetometerScreen extends StatelessWidget {
  const MagnetometerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('magetometer'),
      ),
      body: const Center(
        child: Text('Hola'),
      ),
    );
  }
}
