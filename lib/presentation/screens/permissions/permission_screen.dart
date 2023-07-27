import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

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

class _Permissionview extends ConsumerWidget {
  const _Permissionview();

  @override
  Widget build(BuildContext context, ref) {
    final permissions = ref.watch(permissionProvider);
    return ListView(
      children: [
        CheckboxListTile(
            value: permissions.cameraGranted,
            title: const Text('camera'),
            subtitle: Text('${permissions.camera}'),
            onChanged: (_) {
              ref.read(permissionProvider.notifier).requestCameraAccess();
            }),
        CheckboxListTile(
            value: permissions.photoLibraryGranted,
            title: const Text('Gallery'),
            subtitle: Text('${permissions.photoLibrary}'),
            onChanged: (_) {
              ref.read(permissionProvider.notifier).requestPhotoLibraryAccess();
            }),
        CheckboxListTile(
            value: permissions.photoLibraryGranted,
            title: const Text('Sensors'),
            subtitle: Text('${permissions.sensors}'),
            onChanged: (_) {
              ref.read(permissionProvider.notifier).requestSensorAccess();
            }),
        CheckboxListTile(
            value: permissions.photoLibraryGranted,
            title: const Text('Location'),
            subtitle: Text('${permissions.location}'),
            onChanged: (_) {
              ref.read(permissionProvider.notifier).requestLocationAccess();
            }),
      ],
    );
  }
}
