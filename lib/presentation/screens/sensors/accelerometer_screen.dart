import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

class AccelerometerScreen extends ConsumerWidget {
  const AccelerometerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accelerometerGravity$ = ref.watch(accelerometerGravityProvider);
    final accelerometerUser$ = ref.watch(accelerometerUserProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Acelerometro')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Acelerometro Gravedad', style: TextStyle(fontSize: 30)),
          accelerometerGravity$.when(
            data: (data) =>
                Text(data.toString(), style: const TextStyle(fontSize: 30)),
            error: (error, stackTrace) => const Text('error'),
            loading: () => const CircularProgressIndicator(),
          ),
          const SizedBox(height: 20),
          const Divider(),
          const SizedBox(height: 20),
          const Text('Acelerometro Usuario', style: TextStyle(fontSize: 30)),
          accelerometerUser$.when(
            data: (data) =>
                Text(data.toString(), style: const TextStyle(fontSize: 30)),
            error: (error, stackTrace) => const Text('error'),
            loading: () => const CircularProgressIndicator(),
          ),
        ],
      )),
    );
  }
}
