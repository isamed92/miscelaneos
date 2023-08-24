import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

class GyroscopeScreen extends ConsumerWidget {
  const GyroscopeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gyroscope$ = ref.watch(gyrosopeProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Giroscopio')),
      body: Center(
          child: gyroscope$.when(
              data: (value) =>
                  Text(value.toString(), style: const TextStyle(fontSize: 30)),
              error: (error, stackTrace) => Text('$error'),
              loading: () => const CircularProgressIndicator())),
    );
  }
}
