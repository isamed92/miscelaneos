import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

class MagnetometerScreen extends ConsumerWidget {
  const MagnetometerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final magnetometer$ = ref.watch(magnetometerProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Magnetometro')),
      body: Center(
          child: magnetometer$.when(
        data: (data) => Text(data.toString()),
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const CircularProgressIndicator(),
      )),
    );
  }
}
