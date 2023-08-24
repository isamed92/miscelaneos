import 'package:flutter/material.dart';

class CompassScreen extends StatelessWidget {
  const CompassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Brujula')),
      body: const Center(child: Text('CompassScreen')),
    );
  }
}
