import 'package:flutter/material.dart';

class GyroscopeScreen extends StatelessWidget {
  const GyroscopeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Giroscopio')),
      body: const Center(child: Text('GyroscopeScreen')),
    );
  }
}
