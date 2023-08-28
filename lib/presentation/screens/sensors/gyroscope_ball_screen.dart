import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class GyroscopeBallScreen extends ConsumerWidget {
  const GyroscopeBallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gyroscope$ = ref.watch(gyrosopeProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Giroscopio Bola')),
      body: SizedBox.expand(
        child: gyroscope$.when(
          data: (data) => _MovingBall(data.x, data.y),
          error: (error, stackTrace) => Text('$error'),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}

class _MovingBall extends StatelessWidget {
  final double x;
  final double y;
  const _MovingBall(this.x, this.y);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    final currentYPos = y * 150;
    final currentXPos = x * 150;
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedPositioned(
          left: (currentYPos - 25) + (width / 2),
          top: (currentXPos - 25) + (height / 2),
          duration: const Duration(microseconds: 900),
          curve: Curves.easeInOut,
          child: const _Ball(),
        ),
        Positioned(
            top: 0,
            child:
                Text('''x: $x y: $y''', style: const TextStyle(fontSize: 30))),
      ],
    );
  }
}

class _Ball extends StatelessWidget {
  const _Ball();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
