import 'package:flutter/material.dart';

class PermissionScreen extends StatelessWidget {
  const PermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permission'),
      ),
      body: const _Permissionview(),
    );
  }
}

class _Permissionview extends StatelessWidget {
  const _Permissionview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CheckboxListTile(
            value: true,
            title: const Text('camera'),
            subtitle: const Text('Actual state'),
            onChanged: (value) {})
      ],
    );
  }
}
