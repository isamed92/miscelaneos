import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';
import 'package:miscelaneos/presentation/screens/screens.dart';
import 'dart:math' show pi;

class CompassScreen extends ConsumerWidget {
  const CompassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationGranted = ref.watch(permissionsProvider).locationGranted;
    final compassHeading$ = ref.watch(compassProvider);

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
      body: Center(
          child: compassHeading$.when(
              data: (heading) => Compass(heading: heading ?? 0),
              error: (error, stackTrace) => Text(
                    '$error',
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
              loading: () => const CircularProgressIndicator())),
    );
  }
}

class Compass extends StatefulWidget {
  final double heading;
  const Compass({
    super.key,
    required this.heading,
  });

  @override
  State<Compass> createState() => _CompassState();
}

class _CompassState extends State<Compass> {
  double prevValue = 0.0;
  double turns = 0;

  double getTurns() {
    double? direction = widget.heading;
    direction = (direction < 0) ? (360 + direction) : direction;

    double diff = direction - prevValue;
    if (diff.abs() > 180) {
      if (prevValue > direction) {
        diff = 360 - (direction - prevValue).abs();
      } else {
        diff = 360 - (prevValue - direction).abs();
        diff = diff * -1;
      }
    }

    turns += (diff / 360);
    prevValue = direction;

    return turns * -1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('${widget.heading.ceil()}',
              style: const TextStyle(color: Colors.white, fontSize: 30)),
          const SizedBox(height: 20),
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset('assets/compass/quadrant-1.png'),
              Transform.rotate(
                  angle: widget.heading * (pi / 180) * -1,
                  child: Image.asset('assets/compass/needle-1.png')),
              AnimatedRotation(
                  curve: Curves.easeOut,
                  turns: getTurns(),
                  duration: const Duration(seconds: 1),
                  child: Image.asset('assets/compass/needle-2.png')),
            ],
          )
        ]);
  }
}
