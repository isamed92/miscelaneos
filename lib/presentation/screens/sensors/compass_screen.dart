import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';
import 'package:miscelaneos/presentation/screens/screens.dart';

class CompassScreen extends ConsumerWidget {
  const CompassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationGranted = ref.watch(permissionsProvider).locationGranted;

    if (!locationGranted) {
      return const AskLocationScreen();
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Brujula', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: const Center(child: Compass()),
    );
  }
}

class Compass extends StatelessWidget {
  const Compass({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('155',
              style: TextStyle(color: Colors.white, fontSize: 30)),
          const SizedBox(height: 20),
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset('assets/compass/quadrant-1.png'),
              Image.asset('assets/compass/needle-1.png'),
            ],
          )
        ]);
  }
}
