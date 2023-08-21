import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';

class PermissionScreen extends StatelessWidget {
  const PermissionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permissions'),
      ),
      body: const _PermissionsView(),
    );
  }
}

class _PermissionsView extends ConsumerWidget {
  const _PermissionsView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final permissions = ref.watch(permissionsProvider);
    return ListView(
      children: [
        CheckboxListTile(
            value: permissions.cameraGranted,
            title: const Text('Camara'),
            subtitle: Text('${permissions.camera}'),
            onChanged: (_) =>
                ref.read(permissionsProvider.notifier).requestCameraAccess()),
        CheckboxListTile(
            value: permissions.photoLibraryGranted,
            title: const Text('Galeria de fotos'),
            subtitle: Text('${permissions.photoLibrary}'),
            onChanged: (_) => ref
                .read(permissionsProvider.notifier)
                .requestPhotoLibraryAccess()),
        CheckboxListTile(
            value: permissions.locationAlwaysGranted,
            title: const Text('Ubicacion'),
            subtitle: Text('${permissions.location}'),
            onChanged: (_) =>
                ref.read(permissionsProvider.notifier).requestLocationAcces()),
        CheckboxListTile(
            value: permissions.sensorsGranted,
            title: const Text('Sensores'),
            subtitle: Text('${permissions.sensors}'),
            onChanged: (_) =>
                ref.read(permissionsProvider.notifier).requestSensorsAccess()),
      ],
    );
  }
}
