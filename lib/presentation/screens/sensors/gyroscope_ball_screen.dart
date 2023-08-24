import 'package:flutter/material.dart';

class GyroscopeBallScreen extends StatelessWidget {
  const GyroscopeBallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Giroscopio Bola')),
      body: const Center(child: Text('GyroscopeBallScreen')),
    );
  }
}
