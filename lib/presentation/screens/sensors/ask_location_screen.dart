import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class AskLocationScreen extends ConsumerWidget {
  const AskLocationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Permiso requerido',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Center(
          child: FilledButton(
        onPressed: () {
          ref.read(permissionsProvider.notifier).requestLocationAcces();
        },
        child: const Text('Localizacion necesaria'),
      )),
    );
  }
}
